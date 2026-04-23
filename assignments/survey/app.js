document.addEventListener('DOMContentLoaded', () => {
  if (typeof surveyData === 'undefined') {
    console.error('surveyData is not defined. Make sure data.js is loaded.');
    return;
  }

  // Register the DataLabels plugin
  if (typeof ChartDataLabels !== 'undefined') {
    Chart.register(ChartDataLabels);
  }

  // Aesthetic High-Contrast Palette (Neon & Vibrant Pastel on Dark Mode)
  const colors = [
    '#3b82f6', // Bright Blue
    '#10b981', // Emerald Green
    '#f59e0b', // Amber
    '#ec4899', // Pink
    '#8b5cf6', // Violet
    '#14b8a6', // Teal
    '#f43f5e', // Rose
    '#eab308', // Yellow
    '#0ea5e9', // Sky Blue
    '#6366f1'  // Indigo
  ];

  // Configure Chart.js defaults for dark theme
  Chart.defaults.font.family = "'Inter', sans-serif";
  Chart.defaults.color = '#a1a1aa'; // text-secondary
  Chart.defaults.plugins.tooltip.backgroundColor = '#18181b'; // surface-color
  Chart.defaults.plugins.tooltip.titleColor = '#f4f4f5';
  Chart.defaults.plugins.tooltip.bodyColor = '#e4e4e7';
  Chart.defaults.plugins.tooltip.borderColor = '#27272a';
  Chart.defaults.plugins.tooltip.borderWidth = 1;
  Chart.defaults.plugins.tooltip.padding = 12;
  Chart.defaults.plugins.tooltip.cornerRadius = 8;
  Chart.defaults.plugins.tooltip.boxPadding = 6;

  // Helper to split text into multiple lines so it doesn't get truncated
  function formatMultilineLabel(text, maxLineLength = 40) {
    if (!text || text.length <= maxLineLength) return text;
    const words = text.split(' ');
    let lines = [];
    let currentLine = words[0];
    
    for (let i = 1; i < words.length; i++) {
      if ((currentLine.length + words[i].length + 1) <= maxLineLength) {
        currentLine += ' ' + words[i];
      } else {
        lines.push(currentLine);
        currentLine = words[i];
      }
    }
    lines.push(currentLine);
    return lines;
  }

  // Process each section
  const sections = ['section1', 'section2', 'section3', 'section4', 'section5'];
  
  sections.forEach((sectionKey) => {
    const data = surveyData[sectionKey];
    if (!data || data.length === 0) return;

    const gridEl = document.getElementById(`grid-${sectionKey}`);
    const statEl = document.getElementById(`stat-${sectionKey}`);
    
    if (statEl) {
      statEl.textContent = `${data.length} Respuestas Totales`;
    }

    if (!gridEl) return;

    const questions = Object.keys(data[0]).filter(key => key.trim() !== '');

    questions.forEach((question, index) => {
      // Aggregate data
      const counts = {};
      data.forEach(row => {
        const answer = row[question];
        if (answer) {
          const cleanAnswer = answer.trim();
          counts[cleanAnswer] = (counts[cleanAnswer] || 0) + 1;
        }
      });

      // Sort by count descending
      const sortedEntries = Object.entries(counts).sort((a, b) => b[1] - a[1]);
      const labels = sortedEntries.map(e => e[0]);
      const values = sortedEntries.map(e => e[1]);
      const totalResponses = values.reduce((sum, val) => sum + val, 0);

      // Create DOM elements
      const cardEl = document.createElement('div');
      cardEl.className = 'chart-card';

      const titleEl = document.createElement('h3');
      titleEl.className = 'chart-title';
      titleEl.textContent = question;

      const containerEl = document.createElement('div');
      containerEl.className = 'chart-container';

      const canvasEl = document.createElement('canvas');
      containerEl.appendChild(canvasEl);

      cardEl.appendChild(titleEl);
      cardEl.appendChild(containerEl);
      gridEl.appendChild(cardEl);

      const maxLabelLength = Math.max(...labels.map(l => l.length));
      let type = 'bar';
      let indexAxis = 'y'; // horizontal bar
      
      if (labels.length <= 3 && maxLabelLength < 30) {
        type = 'doughnut';
      }

      // We assign the vivid colors array to BOTH chart types
      // so each bar/slice gets a distinct highly-contrasting color
      const backgroundColors = labels.map((_, i) => colors[i % colors.length]);

      const chartConfig = {
        type: type,
        data: {
          labels: labels,
          datasets: [{
            label: 'Respuestas',
            data: values,
            backgroundColor: backgroundColors,
            borderRadius: type === 'bar' ? 6 : 0,
            borderWidth: type === 'doughnut' ? 3 : 0,
            borderColor: '#09090b', // match dark bg for doughnut gaps
            hoverOffset: type === 'doughnut' ? 6 : 0
          }]
        },
        options: {
          responsive: true,
          maintainAspectRatio: false,
          layout: {
            padding: {
              top: 10,
              bottom: 10,
              left: 10,
              // Add right padding for horizontal bars so the datalabels aren't cut off
              right: type === 'bar' ? 40 : 10
            }
          },
          plugins: {
            legend: {
              display: type === 'doughnut',
              position: 'bottom',
              labels: {
                color: '#e4e4e7',
                boxWidth: 12,
                usePointStyle: true,
                padding: 20,
                font: { size: 13, weight: 500 }
              }
            },
            tooltip: {
              callbacks: {
                label: function(context) {
                  const value = context.raw;
                  const percentage = ((value / totalResponses) * 100).toFixed(1);
                  return ` ${value} respuestas (${percentage}%)`;
                }
              }
            },
            // Configure Datalabels Plugin
            datalabels: {
              display: true,
              formatter: function(value, context) {
                const percentage = ((value / totalResponses) * 100).toFixed(0) + '%';
                if (type === 'doughnut') {
                  // For doughnut, only show if area is large enough
                  return percentage;
                } else {
                  // For bar, show value + percentage
                  return `${value} (${percentage})`;
                }
              },
              color: type === 'doughnut' ? '#ffffff' : '#f4f4f5',
              anchor: type === 'doughnut' ? 'center' : 'end',
              align: type === 'doughnut' ? 'center' : 'right',
              font: {
                weight: 'bold',
                size: 13
              },
              textShadowBlur: 4,
              textShadowColor: 'rgba(0,0,0,0.5)' // subtle drop shadow for contrast
            }
          }
        }
      };

      if (type === 'bar') {
        chartConfig.options.indexAxis = indexAxis;
        chartConfig.options.scales = {
          x: {
            beginAtZero: true,
            grid: {
              color: '#27272a', // subtle grid lines in dark mode
              drawBorder: false
            },
            ticks: {
              color: '#a1a1aa',
              precision: 0,
              font: { size: 12 }
            }
          },
          y: {
            grid: {
              display: false,
              drawBorder: false
            },
            ticks: {
              color: '#e4e4e7',
              font: { size: 13, weight: 500 },
              callback: function(value) {
                // Wrap text into multiple lines instead of truncating
                const labelText = this.getLabelForValue(value);
                return formatMultilineLabel(labelText, 45);
              }
            }
          }
        };
        chartConfig.options.plugins.legend.display = false;
      }

      new Chart(canvasEl, chartConfig);
    });
  });

  // Intersection Observer for sidebar highlighting
  const sectionEls = document.querySelectorAll('.survey-section');
  const navLinks = document.querySelectorAll('.nav-links a');

  const observerOptions = {
    root: null,
    rootMargin: '-20% 0px -80% 0px',
    threshold: 0
  };

  const observer = new IntersectionObserver((entries) => {
    entries.forEach(entry => {
      if (entry.isIntersecting) {
        const id = entry.target.getAttribute('id');
        navLinks.forEach(link => {
          link.classList.remove('active');
          if (link.getAttribute('href') === `#${id}`) {
            link.classList.add('active');
          }
        });
      }
    });
  }, observerOptions);

  sectionEls.forEach(section => observer.observe(section));
});

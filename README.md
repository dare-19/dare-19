<style>
:root {
  --primary: #0099ff;
  --secondary: #ff0066;
  --dark: #0a0e27;
  --light: #f0f4ff;
}

* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

body {
  background: linear-gradient(135deg, #0a0e27 0%, #1a2546 100%);
  font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
  overflow-x: hidden;
}

.hero-container {
  min-height: 100vh;
  background: linear-gradient(135deg, rgba(10, 14, 39, 0.9) 0%, rgba(26, 37, 70, 0.9) 100%),
              url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1200 800"><defs><pattern id="grid" width="40" height="40" patternUnits="userSpaceOnUse"><path d="M 40 0 L 0 0 0 40" fill="none" stroke="%23ffffff" stroke-width="0.5" opacity="0.1"/></pattern></defs><rect width="1200" height="800" fill="url(%23grid)"/></svg>');
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  text-align: center;
  color: white;
  position: relative;
  overflow: hidden;
}

.animated-bg {
  position: absolute;
  width: 100%;
  height: 100%;
  top: 0;
  left: 0;
  z-index: 0;
  background: 
    radial-gradient(circle at 20% 50%, rgba(0, 153, 255, 0.1) 0%, transparent 50%),
    radial-gradient(circle at 80% 80%, rgba(255, 0, 102, 0.1) 0%, transparent 50%);
  animation: float 20s ease-in-out infinite;
}

@keyframes float {
  0%, 100% { transform: translate(0px, 0px); }
  50% { transform: translate(30px, -30px); }
}

.hero-content {
  position: relative;
  z-index: 1;
  max-width: 900px;
  padding: 40px;
}

h1 {
  font-size: 4.5em;
  font-weight: 900;
  margin-bottom: 20px;
  background: linear-gradient(135deg, #0099ff 0%, #ff0066 50%, #00ffcc 100%);
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
  background-clip: text;
  animation: glow 3s ease-in-out infinite;
}

@keyframes glow {
  0%, 100% { filter: drop-shadow(0 0 20px rgba(0, 153, 255, 0.5)); }
  50% { filter: drop-shadow(0 0 30px rgba(255, 0, 102, 0.5)); }
}

.subtitle {
  font-size: 1.8em;
  color: #00ffcc;
  margin-bottom: 40px;
  font-weight: 300;
  text-shadow: 0 0 20px rgba(0, 255, 204, 0.3);
}

.button-group {
  display: flex;
  gap: 20px;
  justify-content: center;
  flex-wrap: wrap;
  margin-bottom: 60px;
}

.btn-3d {
  position: relative;
  padding: 18px 40px;
  font-size: 1.1em;
  font-weight: 700;
  text-decoration: none;
  border: 2px solid;
  border-radius: 50px;
  cursor: pointer;
  transition: all 0.3s ease;
  text-transform: uppercase;
  letter-spacing: 1.5px;
  transform: translateZ(0);
  box-shadow: 0 10px 30px rgba(0, 0, 0, 0.3);
}

.btn-primary {
  background: linear-gradient(135deg, #0099ff 0%, #0077cc 100%);
  color: white;
  border-color: #0099ff;
  box-shadow: 0 15px 40px rgba(0, 153, 255, 0.4), inset 0 -2px 0 rgba(0, 0, 0, 0.2);
}

.btn-primary:hover {
  transform: translateY(-5px) scale(1.05);
  box-shadow: 0 25px 50px rgba(0, 153, 255, 0.6), inset 0 -2px 0 rgba(0, 0, 0, 0.2);
  background: linear-gradient(135deg, #00aaff 0%, #0088dd 100%);
}

.btn-primary:active {
  transform: translateY(-2px) scale(1.02);
}

.btn-secondary {
  background: linear-gradient(135deg, #ff0066 0%, #cc0052 100%);
  color: white;
  border-color: #ff0066;
  box-shadow: 0 15px 40px rgba(255, 0, 102, 0.4), inset 0 -2px 0 rgba(0, 0, 0, 0.2);
}

.btn-secondary:hover {
  transform: translateY(-5px) scale(1.05);
  box-shadow: 0 25px 50px rgba(255, 0, 102, 0.6), inset 0 -2px 0 rgba(0, 0, 0, 0.2);
  background: linear-gradient(135deg, #ff1177 0%, #dd0062 100%);
}

.btn-secondary:active {
  transform: translateY(-2px) scale(1.02);
}

.btn-outline {
  background: transparent;
  color: #00ffcc;
  border-color: #00ffcc;
  box-shadow: 0 15px 40px rgba(0, 255, 204, 0.2), inset 0 -2px 0 rgba(0, 0, 0, 0.2);
}

.btn-outline:hover {
  background: rgba(0, 255, 204, 0.1);
  transform: translateY(-5px) scale(1.05);
  box-shadow: 0 25px 50px rgba(0, 255, 204, 0.4), inset 0 -2px 0 rgba(0, 0, 0, 0.2);
}

.btn-outline:active {
  transform: translateY(-2px) scale(1.02);
}

.stats-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
  gap: 20px;
  margin: 60px 0;
  width: 100%;
  max-width: 1000px;
}

.stat-card {
  background: linear-gradient(135deg, rgba(0, 153, 255, 0.1) 0%, rgba(255, 0, 102, 0.1) 100%);
  border: 2px solid;
  border-image: linear-gradient(135deg, #0099ff, #ff0066) 1;
  padding: 30px;
  border-radius: 20px;
  backdrop-filter: blur(10px);
  transition: all 0.4s ease;
  transform: perspective(1000px) rotateX(0deg) rotateY(0deg);
  box-shadow: 0 20px 40px rgba(0, 0, 0, 0.3);
}

.stat-card:hover {
  transform: perspective(1000px) rotateX(5deg) rotateY(5deg) translateZ(20px);
  box-shadow: 0 30px 60px rgba(0, 153, 255, 0.3);
  background: linear-gradient(135deg, rgba(0, 153, 255, 0.2) 0%, rgba(255, 0, 102, 0.2) 100%);
}

.stat-number {
  font-size: 3em;
  font-weight: 900;
  background: linear-gradient(135deg, #0099ff, #ff0066);
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
  background-clip: text;
  margin-bottom: 10px;
}

.stat-label {
  font-size: 1.1em;
  color: #00ffcc;
  font-weight: 600;
  text-transform: uppercase;
  letter-spacing: 1px;
}

.skills-section {
  margin-top: 80px;
  padding: 60px 40px;
  background: linear-gradient(135deg, rgba(0, 153, 255, 0.05) 0%, rgba(255, 0, 102, 0.05) 100%);
  border-radius: 30px;
  width: 100%;
}

.section-title {
  font-size: 2.5em;
  margin-bottom: 40px;
  color: #00ffcc;
  text-transform: uppercase;
  letter-spacing: 2px;
}

.skills-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(150px, 1fr));
  gap: 15px;
}

.skill-badge {
  background: linear-gradient(135deg, #0099ff 0%, #ff0066 100%);
  padding: 15px 20px;
  border-radius: 25px;
  font-weight: 700;
  color: white;
  text-align: center;
  transition: all 0.3s ease;
  box-shadow: 0 10px 30px rgba(0, 153, 255, 0.3);
  text-transform: uppercase;
  font-size: 0.9em;
  letter-spacing: 1px;
}

.skill-badge:hover {
  transform: translateY(-10px) scale(1.1) rotateZ(5deg);
  box-shadow: 0 20px 50px rgba(0, 153, 255, 0.5);
}

.floating {
  animation: floating 3s ease-in-out infinite;
}

@keyframes floating {
  0%, 100% { transform: translateY(0px); }
  50% { transform: translateY(-20px); }
}

.pulse {
  animation: pulse 2s ease-in-out infinite;
}

@keyframes pulse {
  0%, 100% { opacity: 1; }
  50% { opacity: 0.5; }
}

.line-animation {
  position: relative;
  height: 2px;
  background: linear-gradient(90deg, transparent, #0099ff, #ff0066, transparent);
  margin: 40px 0;
  animation: slideIn 1.5s ease-in-out;
}

@keyframes slideIn {
  from { width: 0; }
  to { width: 100%; }
}

.connect-buttons {
  display: flex;
  gap: 15px;
  justify-content: center;
  flex-wrap: wrap;
  margin-top: 40px;
}

.social-btn {
  width: 60px;
  height: 60px;
  border-radius: 50%;
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 1.5em;
  text-decoration: none;
  border: 2px solid;
  transition: all 0.3s ease;
  box-shadow: 0 10px 30px rgba(0, 0, 0, 0.3);
  transform: perspective(1000px) rotateX(0deg);
}

.social-btn-github {
  background: linear-gradient(135deg, #333, #555);
  border-color: #0099ff;
  color: #0099ff;
}

.social-btn-github:hover {
  transform: perspective(1000px) rotateX(15deg) translateY(-8px);
  box-shadow: 0 20px 50px rgba(0, 153, 255, 0.5);
  background: linear-gradient(135deg, #0099ff, #0077cc);
  color: white;
}

.social-btn-linkedin {
  background: linear-gradient(135deg, #0077b5, #005885);
  border-color: #00ffcc;
  color: #00ffcc;
}

.social-btn-linkedin:hover {
  transform: perspective(1000px) rotateX(15deg) translateY(-8px);
  box-shadow: 0 20px 50px rgba(0, 255, 204, 0.5);
  background: linear-gradient(135deg, #00ffcc, #00cc99);
  color: #0a0e27;
}

.social-btn-twitter {
  background: linear-gradient(135deg, #1da1f2, #1a8cd8);
  border-color: #ff0066;
  color: #ff0066;
}

.social-btn-twitter:hover {
  transform: perspective(1000px) rotateX(15deg) translateY(-8px);
  box-shadow: 0 20px 50px rgba(255, 0, 102, 0.5);
  background: linear-gradient(135deg, #ff0066, #cc0052);
  color: white;
}

.container {
  max-width: 1200px;
  margin: 0 auto;
  padding: 0 20px;
}

@media (max-width: 768px) {
  h1 { font-size: 2.5em; }
  .subtitle { font-size: 1.3em; }
  .button-group { flex-direction: column; }
  .btn-3d { width: 100%; }
  .skills-grid { grid-template-columns: repeat(auto-fit, minmax(120px, 1fr)); }
}
</style>

<div class="hero-container">
  <div class="animated-bg"></div>
  
  <div class="hero-content">
    <h1>🚀 DevOps Engineer</h1>
    <p class="subtitle">Infrastructure Architect | Cloud Native | Full Stack Automation</p>
    
    <div class="button-group">
      <a href="#portfolio" class="btn-3d btn-primary">View Portfolio</a>
      <a href="#projects" class="btn-3d btn-secondary">My Projects</a>
      <a href="#contact" class="btn-3d btn-outline">Get In Touch</a>
    </div>

    <div class="line-animation"></div>

    <div class="stats-grid">
      <div class="stat-card floating">
        <div class="stat-number">50+</div>
        <div class="stat-label">Projects</div>
      </div>
      <div class="stat-card floating" style="animation-delay: 0.2s;">
        <div class="stat-number">100%</div>
        <div class="stat-label">Uptime</div>
      </div>
      <div class="stat-card floating" style="animation-delay: 0.4s;">
        <div class="stat-number">5+</div>
        <div class="stat-label">Years XP</div>
      </div>
    </div>

    <div class="line-animation"></div>

    <div class="skills-section">
      <h2 class="section-title">🛠️ Tech Stack</h2>
      <div class="skills-grid">
        <span class="skill-badge">Kubernetes</span>
        <span class="skill-badge">Docker</span>
        <span class="skill-badge">Terraform</span>
        <span class="skill-badge">AWS</span>
        <span class="skill-badge">Python</span>
        <span class="skill-badge">GitHub Actions</span>
        <span class="skill-badge">Prometheus</span>
        <span class="skill-badge">Grafana</span>
        <span class="skill-badge">Jenkins</span>
        <span class="skill-badge">Ansible</span>
        <span class="skill-badge">PostgreSQL</span>
        <span class="skill-badge">Redis</span>
      </div>
    </div>

    <div class="line-animation"></div>

    <div style="margin-top: 50px;">
      <h2 class="section-title">📞 Connect With Me</h2>
      <div class="connect-buttons">
        <a href="https://github.com/dare-19" class="social-btn social-btn-github" title="GitHub">
          <span>👨‍💻</span>
        </a>
        <a href="https://linkedin.com/in/dare-19" class="social-btn social-btn-linkedin" title="LinkedIn">
          <span>💼</span>
        </a>
        <a href="https://twitter.com/dare-19" class="social-btn social-btn-twitter" title="Twitter">
          <span>🐦</span>
        </a>
      </div>
    </div>

    <div style="margin-top: 60px; color: #00ffcc; font-size: 0.95em;">
      <p>✨ Crafted with passion for infrastructure excellence ✨</p>
      <p style="margin-top: 10px; font-size: 0.85em; opacity: 0.8;">Last Updated: 2026-03-31 | Always Open for Collaboration 🤝</p>
    </div>
  </div>
</div>

---

## 🎯 Featured Projects

### Project 1: Multi-Cloud Infrastructure Automation
Advanced Terraform automation for AWS, GCP, and Azure with complete CI/CD integration.

### Project 2: Kubernetes Microservices Platform
Enterprise-grade K8s deployment with service mesh, monitoring, and GitOps.

### Project 3: Infrastructure Monitoring Solution
Prometheus + Grafana stack with custom dashboards and alerting.

---

## 📚 Documentation

- 📖 [Infrastructure Architecture](./INFRASTRUCTURE.md)
- 🔄 [CI/CD Pipelines](./CI_CD.md)
- 🛠️ [DevOps Tools Guide](./DEVOPS_TOOLS.md)

---

<div align="center">

**Made with 💙 | Open Source Enthusiast | DevOps Advocate**

</div>

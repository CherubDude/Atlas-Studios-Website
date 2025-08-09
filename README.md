# Atlas Studios Website

A professional website for Atlas Studios, a Roblox game development studio specializing in Ground Works Simulations.

## Features

- **Modern Dark Theme**: Sleek dark design matching your mockups
- **Responsive Design**: Works perfectly on desktop, tablet, and mobile devices
- **GitHub Pages Compatible**: Ready to deploy on GitHub Pages
- **Interactive Elements**: Smooth animations and hover effects
- **Professional Layout**: Hero section with logo showcase and comprehensive features section

## Quick Setup for GitHub Pages

1. **Create a new GitHub repository** for your website
2. **Upload all files** from this folder to your repository
3. **Enable GitHub Pages**:
   - Go to your repository settings
   - Scroll down to "Pages" section
   - Select "Deploy from a branch"
   - Choose "main" branch and "/ (root)" folder
   - Click "Save"

Your website will be available at: `https://yourusername.github.io/your-repository-name`

## File Structure

```
atlas-studios-website/
├── index.html          # Main HTML file
├── styles.css          # CSS styling
├── script.js           # JavaScript functionality
├── README.md           # This file
├── favicon.svg         # Website favicon
├── .gitignore          # Git ignore file
└── assets/
    ├── atlas-logo.png      # Navigation logo (with text)
    ├── atlas-logo-card.png # Hero section logo (symbol only)
    └── game-screenshot.png # Your actual game screenshot
```

## Customization

### Update Logos
Replace the PNG files in the `assets/` folder with your actual Atlas Studios logo images:
- `atlas-logo.png` - Full logo with "Atlas." text for navigation bar
- `atlas-logo-card.png` - Symbol-only version for hero showcase card

### Add Your Game Screenshot
Replace the placeholder `assets/game-screenshot.png` with your actual game screenshot. The website is already configured to display your "Ground Works Simulations - Coming Soon" image showing the airport runway scene.

### Update Join Button
In `script.js`, update the join button click handler to link to your Discord server:

```javascript
joinBtn.addEventListener('click', function() {
    window.open('https://discord.gg/your-discord-invite', '_blank');
});
```

### Update Navigation Links
Modify the navigation links in `index.html` to point to your actual pages or sections.

### Add Content
Feel free to add more sections, pages, or modify the existing content to match your game studio's needs.

## Browser Support

- Chrome/Chromium (latest)
- Firefox (latest)
- Safari (latest)
- Edge (latest)

## Technologies Used

- HTML5
- CSS3 (with Flexbox and Grid)
- Vanilla JavaScript
- SVG Graphics
- Google Fonts (Inter)

## Performance Features

- Optimized CSS with minimal dependencies
- Efficient SVG graphics
- Smooth animations with CSS transforms
- Responsive images
- Lightweight JavaScript

## License

This website template is provided as-is for Atlas Studios. Feel free to modify and customize as needed for your game studio.

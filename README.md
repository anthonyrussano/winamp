# Winamp Web Player

A nostalgic web-based implementation of the classic Winamp media player, powered by [Webamp](https://webamp.org/). Experience the iconic Winamp 2.9 interface right in your browser with full functionality and authentic styling.

## 🎵 Features

- **Classic Winamp Interface**: Authentic recreation of the legendary Winamp 2.9 UI
- **Browser-Based**: No installation required - runs entirely in your web browser
- **Fully Functional**: Play audio files, manage playlists, and enjoy visualizations
- **Lightweight**: Minimal server footprint with Python HTTP server
- **Docker Support**: Easy deployment with Docker and Docker Compose
- **Responsive**: Works across modern browsers

## 📋 Prerequisites

Choose one of the following options:

### Option 1: Local Development
- Python 3.11 or higher
- Modern web browser (Chrome, Firefox, Safari, Edge)

### Option 2: Docker
- Docker Engine 20.10+
- Docker Compose 1.29+ (optional, for docker-compose deployment)

## 🚀 Quick Start

### Method 1: Run Locally with Python

1. Clone the repository:
```bash
git clone <repository-url>
cd winamp
```

2. Start the server:
```bash
python server.py
```

3. Open your browser and navigate to:
```
http://localhost:8080
```

### Method 2: Run with Docker

1. Build and run using Docker:
```bash
docker build -t winamp-player .
docker run -p 8080:8080 winamp-player
```

2. Access the application at:
```
http://localhost:8080
```

### Method 3: Run with Docker Compose

1. Start the service:
```bash
docker-compose up -d
```

2. Access the application at:
```
http://localhost:8080
```

3. Stop the service:
```bash
docker-compose down
```

## 📁 Project Structure

```
winamp/
├── index.html              # Main HTML entry point
├── server.py              # Simple Python HTTP server
├── webamp.bundle.min.js   # Webamp library bundle
├── Dockerfile             # Docker image configuration
├── docker-compose.yml     # Docker Compose orchestration
└── README.md             # This file
```

## 🔧 Configuration

### Server Port

The default port is `8080`. To change it:

**For Python server:**
Edit `server.py` and modify the `PORT` variable:
```python
PORT = 8080  # Change to your desired port
```

**For Docker:**
Update the port mapping in `docker-compose.yml`:
```yaml
ports:
  - "8080:8080"  # Change the first port to your desired host port
```

### Webamp Configuration

The Webamp instance can be customized by modifying the initialization in `index.html`:
```javascript
const webamp = new window.Webamp({
  // Add configuration options here
  // See: https://github.com/captbaritone/webamp#usage
});
```

Available configuration options include:
- Initial skin
- Initial tracks
- Window layout preferences
- And more...

## 🎨 Using the Player

Once the application is running:

1. **Load Audio**: Drag and drop audio files onto the player or use the playlist editor
2. **Visualizations**: Click the visualization area to cycle through different effects
3. **Equalizer**: Open the equalizer window for audio adjustments
4. **Playlist**: Manage your music queue with the playlist editor
5. **Skins**: Change the appearance (if additional skins are configured)

## 🐳 Docker Details

### Health Check

The Docker Compose configuration includes a health check that:
- Runs every 30 seconds
- Ensures the server is responding
- Automatically restarts if unhealthy

### Image Details

- **Base Image**: `python:3.11-slim`
- **Working Directory**: `/app`
- **Exposed Port**: `8080`
- **Restart Policy**: `unless-stopped`

## 🛠️ Development

### Adding Custom Tracks

To pre-load tracks, modify `index.html`:
```javascript
const webamp = new window.Webamp({
  initialTracks: [
    {
      metaData: {
        artist: "Artist Name",
        title: "Track Title"
      },
      url: "path/to/audio.mp3"
    }
  ]
});
```

### Customizing the UI

The background and container styling can be modified in the `<style>` section of `index.html`.

## 📊 Browser Compatibility

- ✅ Chrome/Chromium 90+
- ✅ Firefox 88+
- ✅ Safari 14+
- ✅ Edge 90+

## 🤝 Contributing

Contributions are welcome! Here's how you can help:

1. Fork the repository
2. Create a feature branch: `git checkout -b feature/amazing-feature`
3. Commit your changes: `git commit -m 'Add amazing feature'`
4. Push to the branch: `git push origin feature/amazing-feature`
5. Open a Pull Request

## 📝 License

This project uses the Webamp library. Please refer to the [Webamp license](https://github.com/captbaritone/webamp/blob/master/LICENSE.txt) for details.

## 🙏 Acknowledgments

- [Webamp](https://webamp.org/) by [Jordan Eldredge](https://github.com/captbaritone) - The amazing JavaScript implementation of Winamp
- Nullsoft - Original creators of Winamp
- The open-source community for continued support and contributions

## 📞 Support

If you encounter any issues or have questions:

1. Check the [Webamp documentation](https://github.com/captbaritone/webamp)
2. Open an issue in this repository
3. Review existing issues for solutions

## 🎯 Roadmap

Potential future enhancements:
- [ ] Add pre-configured music library
- [ ] Support for additional Webamp skins
- [ ] Streaming audio source integration
- [ ] Playlist persistence
- [ ] Mobile-optimized interface

---

**Enjoy the nostalgia! 🎵**

*It really whips the llama's ass!* 🦙

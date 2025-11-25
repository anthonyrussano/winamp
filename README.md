# Winamp Web Player

A nostalgic web-based implementation of the classic Winamp media player, powered by [Webamp](https://webamp.org/). Experience the iconic Winamp 2.9 interface right in your browser with full functionality and authentic styling.

## 🎵 Features

- **Classic Winamp Interface**: Authentic recreation of the legendary Winamp 2.9 UI
- **Browser-Based**: No installation required - runs entirely in your web browser
- **Fully Functional**: Play audio files, manage playlists, and enjoy visualizations
- **Pre-configured Music Library**: Starts with 5 pre-loaded streaming radio stations
- **Streaming Audio**: Built-in support for internet radio stations (SomaFM, Radio Paradise)
- **Playlist Persistence**: Automatically saves and restores your playlist using localStorage
- **Multiple Skins**: Choose from 4 pre-configured Winamp skins
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
2. **Pre-loaded Content**: The player starts with 5 streaming radio stations
3. **Streaming Radio**: Play live internet radio from SomaFM and Radio Paradise
4. **Visualizations**: Click the visualization area to cycle through different effects
5. **Equalizer**: Open the equalizer window for audio adjustments
6. **Playlist**: Manage your music queue with the playlist editor
7. **Skins**: Change the appearance from 4 available skins (right-click → Skins)
8. **Auto-Save**: Your playlist is automatically saved and restored on page reload

### 📻 Pre-configured Streaming Stations

The player includes these streaming radio stations:

- **SomaFM Groove Salad** - Ambient/Downtempo
- **SomaFM Drone Zone** - Ambient Space Music
- **SomaFM Beat Blender** - Electronic Mix
- **SomaFM DEF CON Radio** - Hacker/Tech Music
- **Radio Paradise Main Mix** - Eclectic Music

**Note:** To add your own music files, see the Development section below.

### 💾 Playlist Persistence

Your playlist is automatically saved:
- **Auto-save**: Saves every 5 seconds when changes are detected
- **Manual save**: Saves when you close the browser tab
- **Smart merge**: Combines saved playlists with default tracks
- **Local storage**: Uses browser localStorage (no server required)

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

## 🚢 CI/CD Pipeline

This project includes automated Docker image builds and publishing to Docker Hub via GitHub Actions.

### Workflow Details

The **Generate Docker Image** workflow (`.github/workflows/main.yml`) automatically:

- **Triggers on**:
  - Push to `main` branch
  - Manual workflow dispatch

- **Multi-platform builds**:
  - `linux/amd64` (x86-64)
  - `linux/arm64` (ARM 64-bit)

- **Automatic tagging strategy**:
  - `latest` - Always points to the most recent build from main
  - `sha-<commit>` - Tagged with the first 8 characters of the git commit SHA
  - `<branch>` - Tagged with the sanitized branch name (e.g., `main`)
  - `<version>` - If pushing a git tag, uses that version (e.g., `v1.0.0`)

### Example Tags

For a commit `abc12345` on the `main` branch:
- `username/winamp:latest`
- `username/winamp:sha-abc12345`
- `username/winamp:main`

For a tagged release `v1.2.3`:
- `username/winamp:latest`
- `username/winamp:sha-abc12345`
- `username/winamp:v1.2.3`

### Required Secrets

To use the automated workflow, configure these repository secrets:

- `DOCKER_USERNAME` - Your Docker Hub username
- `DOCKER_PASSWORD` - Your Docker Hub password or access token

### Running a Specific Version

Pull and run a specific version:
```bash
# Run latest version
docker run -p 8080:8080 <username>/winamp:latest

# Run specific commit
docker run -p 8080:8080 <username>/winamp:sha-abc12345

# Run specific release
docker run -p 8080:8080 <username>/winamp:v1.0.0
```

## 🛠️ Development

### Adding Custom Tracks

The player comes pre-configured with 5 streaming radio stations. To add your own music files, you have several options:

#### **Option 1: Host Local Files** (Recommended - No CORS issues)
1. Create a `music` directory in the project
2. Add your MP3 files to it
3. Update `defaultTracks` in `index.html`:

```javascript
const defaultTracks = [
  // ...existing streaming stations...
  {
    metaData: {
      artist: "Your Artist",
      title: "Your Track"
    },
    url: "./music/your-song.mp3",
    duration: 180 // Duration in seconds
  }
];
```

#### **Option 2: Use External URLs** (Must be CORS-enabled)
For external URLs, the server must have proper CORS headers. Test with your browser's console:

```javascript
{
  metaData: {
    artist: "Artist Name",
    title: "Track Title"
  },
  url: "https://example.com/audio.mp3",
  duration: 180
}
```

**CORS Requirements:**
- The audio server must send `Access-Control-Allow-Origin: *` header
- GitHub raw URLs work: `https://raw.githubusercontent.com/user/repo/branch/file.mp3`
- jsDelivr CDN works: `https://cdn.jsdelivr.net/gh/user/repo@version/file.mp3`

#### **Option 3: Add More Streaming Sources**
For internet radio streams, set `duration: 0`:

```javascript
{
  metaData: {
    artist: "Radio Station",
    title: "Station Name"
  },
  url: "https://example.com/stream.mp3",
  duration: 0
}
```

**Note:** Due to CORS restrictions, many external MP3 URLs won't work. Hosting files locally (Option 1) is the most reliable approach.

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

Completed features:
- [x] Pre-configured music library with 5 streaming radio stations
- [x] Streaming audio source integration (SomaFM, Radio Paradise)
- [x] Playlist persistence using localStorage
- [x] Support for multiple Webamp skins (4 skins included)
- [x] Comprehensive documentation for adding local and remote audio files

Potential future enhancements:
- [ ] Mobile-optimized interface
- [ ] Backend music library server
- [ ] User authentication and cloud playlist sync
- [ ] Advanced audio effects and DSP
- [ ] Podcast RSS feed integration

---

**Enjoy the nostalgia! 🎵**

*It really whips the llama's ass!* 🦙

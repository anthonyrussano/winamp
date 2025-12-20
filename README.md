# Winamp Web Player

A nostalgic web-based implementation of the classic Winamp media player, powered by [Webamp](https://webamp.org/). Experience the iconic Winamp 2.9 interface right in your browser with full functionality and authentic styling.

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

## 🎨 Using the Player

Once the application is running:

- **Load Audio**: Drag and drop audio files onto the player or use the playlist editor

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

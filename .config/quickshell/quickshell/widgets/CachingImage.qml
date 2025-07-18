import quickshell.services 1.0
import quickshell.utils 1.0
import Quickshell.Io
import QtQuick

Image {
    id: root

    property string path
    property string hash
    readonly property string cachePath: `${Paths.imagecache}/${hash}@${width}x${height}.png`.slice(7)

    asynchronous: true
    cache: false
    fillMode: Image.PreserveAspectCrop
    sourceSize.width: width
    sourceSize.height: height

    onPathChanged: {
        shaProc.signal(9);
        shaProc.path = path.replace("file://", "");
        shaProc.running = true;
    }

    onCachePathChanged: {
        if (hash)
            source = cachePath;
    }

    onStatusChanged: {
        if (source == cachePath && status === Image.Error)
            source = path;
        else if (source == path && status === Image.Ready) {
            Paths.mkdir(Paths.imagecache);
            const grabPath = cachePath;
            grabToImage(res => res.saveToFile(grabPath));
        }
    }

    Process {
        id: shaProc

        property string path

        command: ["sha256sum", path]
        stdout: StdioCollector {
            onStreamFinished: root.hash = text.split(" ")[0]
        }
    }
}

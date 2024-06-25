# Onyx

Onyx is a voice assistant application built with SwiftUI, providing an interactive voice experience with Siri-like waveform animations.

## Features

- **Voice Recording and Playback**: Record your voice and play it back with different voice types.
- **Siri Waveform Animation**: Visual representation of the audio input to enhance user interaction.
- **State Management**: Seamless handling of different states including idle, recording, processing, and errors.
- **Voice Selection**: Choose from a variety of voice types for playback.

## Installation

To run this project, follow these steps:

1. Clone the repository:
   git clone https://github.com/maveryjr/Onyx.git
3. Open the project in Xcode
4. Build and run the project on your preferred simulator or device.

## Usage
1. Launch the app.
2. Select a voice type from the picker.
3. Tap the record button to start recording your voice.
4. The waveform animation will display the audio input visually.
5. Tap the stop button to stop recording and playback the audio.

## File Structure
**OnyxApp.swift:** Entry point of the application, setting up the main window and view.
**ContentView.swift:** Primary view containing the UI components and interactions.
**ViewModel.swift:** Manages the application's state, audio recording, playback, and UI updates.
**Models.swift:** Defines data models such as VoiceType and VoiceChatState.

## Contributing
Contributions are welcome! Please open an issue or submit a pull request for any improvements or bug fixes.

## License
This project is licensed under the MIT License.

<h1 align="center">Multi-platform Support for macOS and iOS</h1>

<p align="center">  
 This project is a multi-platform application built using SwiftUI. It is organized into three folders: iOS, macOS, and Shared.
</br>
</br>

<ul>
<li>Shared components include reusable views, view models, and repositories that are not dependent on SwiftUI, allowing for efficient code sharing across platforms.</li>
<li>Platform-specific UI components are separated, ensuring that macOS and iOS have tailored user interfaces. With a single codebase, the app behaves differently on each platform:</li>
<li>macOS: Utilizes a sidebar navigation.</li>
<li>iOS: Implements a bottom navigation bar.</li>
<li>The project leverages NavigationPath to manage navigation history. On macOS, where native menu-specific stack history preservation is not provided, custom logic has been implemented to retain the last stack state for each menu. This means users can switch between menus and return to the previously navigated state for each menu independently.</li>
</ul>

- MacOS 
[![Video Label](http://img.youtube.com/vi/YsAy3gaI6mE/0.jpg)](https://youtu.be/YsAy3gaI6mE)
- Click to view as a 'YouTube' video.  


## Tech stack
- Multi-platform Support for macOS and iOS
- SwiftUI, Combine
- MVI Pattern


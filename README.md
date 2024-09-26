# PinDropView
Custom pin drawing

## Demo
Demo app for [PinDropViewDemo](https://github.com/OfTheWolf/PinDropViewDemo)

<table>
<tr>
<th>Default</th>
<th>Customized</th>
</tr>
  <tr>
    <th><img src='./images/demo1.png' height='500'></th>
    <th><img src='./images/demo2.png' height='500'></th>
  </tr>
</table>

## Configuration
```swift
        pinDropView.borderColor = .red
        pinDropView.borderWidth = 10
        pinDropView.fillColor = .white
        pinDropView.icon = .init(systemName: "carrot")!
        pinDropView.iconColor = .orange
        pinDropView.didTapHandler = {
            print("did tap pin")
        }
```


## Installation
### SPM
Add this url in XCode > File > Swift Packages > Add Package Dependency:
```
git@github.com:OfTheWolf/PinDropView.git
```

## Author

uğur, uguboz@gmail.com

## License

PinDropView is available under the MIT license. See the LICENSE file for more info.

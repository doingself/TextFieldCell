# TextFieldCell

获取 table view cell 中 text field 的 text

![image](https://github.com/doingself/TextFieldCell/blob/master/images/TextFieldCell.jpeg)

## TxtField1ViewController

1. 创建 UITextField
```
for i in 0 ... 10 {
    txtArr.append(UITextField())
}
```

2. cellForRowAtIndexPath
```
func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! TextFieldTableViewCell
    
    cell.titleLab.text = String(format: "%d-%d", indexPath.section,indexPath.row)
    let index = indexPath.section * 10 + indexPath.row
    
    txtArr[index] = cell.txtField
    
    return cell
}
```

单元格重用导致 cell.txtField 内容错位


## TxtField2ViewController
可以使用通知 NSNotification.Name.UITextFieldTextDidEndEditing 实现

也可以在 cell.textfield.delegate.textFieldDidEndEditing 中使用 通知、代理、闭包实现


## Requirements
+ Swift 3.0
+ iOS 8.0+
+ Xcode 8+


---


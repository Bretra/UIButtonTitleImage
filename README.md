# UIButtonTitleImage

设置UIButton的title和image在UIButton的任意位置：
上文字下图片，上图片下文字，左文字右图片，左图片右文字

用法：
把UIButton+TitleImageSpaceButton.h和UIButton+TitleImageSpaceButton.m 拖入到工程里面，引入UIButton+TitleImageSpaceButton.h头文件，
生成UIButton对象后，如果要是设置以上说明的title和image的位置，则设置相应的属性。如果没有设置，则会走系统设定好的来显示。

ps：也同时支持只设置一项属性，如：设置title或者image位置。使用runtime，对原有项目无任何污染

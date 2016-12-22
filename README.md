# progress

[![GitHub license](https://img.shields.io/github/license/mashape/apistatus.svg?style=flat-square)](http://goldsborough.mit-license.org)

```
 _ _    _ __   _      __   _ __   __    ___   ___
( '_`\ ( '__)/'_`\  /'_ `\( '__)/'__`\/',__)/',__)
| (_) )| |  ( (_) )( (_) || |  (  ___/\__, \\__, \
| ,__/'(_)  `\___/'`\__  |(_)  `\____)(____/(____/
| |                ( )_) |
(_)                 \___/'
```

`progress`, the pluggable command line progress bar.

## Description

`progress` is a lightweight, configurable script you can source into your own
shell script to include a fancy progress bar informing your users about the
progression of your program. You yourself decide what a unit of progress
means and when progress begins or ends.

## Basic Usage

A basic usage example may look something like this:

```shell
#!/bin/bash
PROGRESS_NUMBER_OF_STEPS=10
source progress.sh

for i in $(seq 10); do
  echo $i
  sleep .1
  progress_step
done
```

Here, we defined the number of steps our program was going to make and then included the progress script in our script. This made one important function available: `progress_start`. You can call it whenever you want to increment your progress bar, and the script will add one unit to the progress bar.

![demo](https://raw.githubusercontent.com/goldsborough/progress/master/other/example.gif?token=AGIcm7AzP2_mzC7Kin7LGZ7sJOJoNdHEks5YZTH3wA%3D%3D)

## Advanced Usage

`progress` is made to be very configurable. Here is a list of variables you can tweak, by setting them before you source the script:

##### `PROGRESS_WIDTH`

How many characters the progress bar should be wide. The `PROGRESS_WIDTH` may be larger or smaller than the number of steps and the progress will adapt itself. Note that when the `PROGRESS_WIDTH` is not divisible by the `PROGRESS_NUMBER_OF_STEPS`, or the other way around, you *must* call `progress_end` instead of `progress_step` at the very end, to fill up the progress bar.

##### `PROGRESS_SYMBOL`

The character to use for progress. It defaults to the unicode character `\u25AC` (▬).

##### `PROGRESS_FILL_SYMBOL`

The character to use for progress not yet made. It defaults to the value of `PROGRESS_SYMBOL` (but with different default color).

##### `PROGRESS_FORMAT`

A semi-colon-delimited list of UNIX terminal format codes to style the `PROGRESS_SYMBOL`, e.g. `1;31` for red and bold.

##### `PROGRESS_FILL_FORMAT`

A semi-colon-delimited list of UNIX terminal format codes to style the `PROGRESS_FILL_SYMBOL`.

##### `PROGRESS_DEFER`

Whether to start the progress bar immediately when sourced or wait until progress_start is called (which you don't have to call if you don't set this variable). The exact value does not matter, it just has to be defined to take effect.

##### `PROGRESS_INDICATOR_FORMAT`

A semi-colon-delimited list of UNIX terminal format codes to use for the step indicator (`step/number of steps`).

##### `PROGRESS_PERCENT_FORMAT`

A semi-colon-delimited list of UNIX terminal format codes to use for the percent value to the right of the progress bar.

##### `PROGRESS_STICKY`

Whether or not to have the progress bar stay sticky on the top of the terminal when it overflows the terminal's number of lines.

##### `progress_line_number`

`progress` exposes the internal variable `progress_line_number`, which you can modify yourself if you print more than one line of text in one step (`progress` assumes by default that one step = one line). You can also set the number of lines printed since the last step by passing that number to `progress_step` as an argument (it defaults to 1).

##### Formatting

You can find a list of "UNIX terminal format codes" as mentioned above here: http://misc.flogisoft.com/bash/tip_colors_and_formatting. These codes allow you to change the foreground and background color, as well as make text bold or even hide something all together (for example if you don't want the percent, you can use format code 8 to hide it).

## LICENSE

This project is released under the [MIT License](http://goldsborough.mit-license.org). For more information, see the LICENSE file.

## Authors

[Peter Goldsborough](http://goldsborough.me) + [cat](https://goo.gl/IpUmJn) :heart:

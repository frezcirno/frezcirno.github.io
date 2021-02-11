#!/bin/bash

#颜色定义
cRed=1
cGreen=2
cYellow=3
cBlue=4
cFuchsia=5
cCyan=6
cWhite=7
colorTable=($cRed $cGreen $cYellow $cBlue $cFuchsia $cCyan $cWhite)

#位置和大小
iLeft=3
iTop=2
((iTrayLeft = iLeft + 2))
((iTrayTop = iTop + 1))
((iTrayWidth = 10))
((iTrayHeight = 15))

#颜色设置
cBorder=$cGreen
cScore=$cFuchsia
cScoreValue=$cCyan

#控制信号
#改游戏使用两个进程，一个用于接收输入，一个用于游戏流程和显示界面;
#当前者接收到上下左右等按键时，通过向后者发送signal的方式通知后者。
sigLeft=26
sigRight=27
sigDown=28
sigUp=29
sigExit=30


map0=(0,0,0,0)
map1=(0,0,0,0)
map2=(0,0,0,0)
map3=(0,0,0,0)
map=($map0,$map1,$map2,$map3)

#接收输入的进程的主函数
function KeyReceiver()
{
    local pidDisplayer key keylist sig cESC sTTY

    pidDisplayer=$1 # 显示进程的pid
    keylist=(0 0 0)

    cESC=`echo -ne "\033"`
    cSpace=`echo -ne "\040"`

    #保存终端属性。在read -s读取终端键时，终端的属性会被暂时改变。
    #如果在read -s时程序被不幸杀掉，可能会导致终端混乱，
    #需要在程序退出时恢复终端属性。
    sTTY=`stty -g`

    #捕捉退出信号
    trap "MyExit;" INT TERM
    trap "RestoreConsole;" $sigExit

    #隐藏光标
    echo -ne "\033[?25l"

    while :
    do
        #读取输入。注-s不回显，-n读到一个字符立即返回
        read -s -n 1 key

        keylist[0]=${keylist[1]}
        keylist[1]=${keylist[2]}
        keylist[2]=$key
        sig=0

        #判断输入了何种键
        if [[ $key == $cESC && ${keylist[1]} == $cESC ]]; then MyExit  #ESC键
        elif [[ ${keylist[0]} == $cESC && ${keylist[1]} == "[" ]]; then
            if [[ $key == "A" ]]; then sig=$sigRotate   # <向上键>
            elif [[ $key == "B" ]]; then sig=$sigDown   # <向下键>
            elif [[ $key == "D" ]]; then sig=$sigLeft   # <向左键>
            elif [[ $key == "C" ]]; then sig=$sigRight  # <向右键>
            fi
        elif [[ $key == "W" || $key == "w" ]]; then sig=$sigRotate  # W, w
        elif [[ $key == "S" || $key == "s" ]]; then sig=$sigDown    # S, s
        elif [[ $key == "A" || $key == "a" ]]; then sig=$sigLeft    # A, a
        elif [[ $key == "D" || $key == "d" ]]; then sig=$sigRight   # D, d
        elif [[ $key == "Q" || $key == "q" ]]; then MyExit          # Q, q
        fi

        if [[ $sig != 0 ]]; then
            #向另一进程发送消息
            kill -$sig $pidDisplayer
        fi
    done
}


#退出前的恢复
function RestoreConsole()
{
    local y

    #恢复终端属性
    stty $sTTY
    ((y = iTop + iTrayHeight + 4))

    #显示光标
    echo -e "\033[?25h\033[${y};0H"
    exit
}


function MyExit()
{
    #通知显示进程需要退出
    kill -$sigExit $pidDisplayer

    RestoreConsole
}


#处理显示和游戏流程的主函数
function Displayer()
{
    local sigThis
    InitDraw

    #挂载各种信号的处理函数
    #语法：trap 执行的操作 收到的信号
    trap "sig=$sigLeft;" $sigLeft
    trap "sig=$sigRight;" $sigRight
    trap "sig=$sigUp;" $sigUp
    trap "sig=$sigDown;" $sigDown
    trap "ShowExit;" $sigExit

    while :
    do
        sleep 0.2
        sigThis=$sig
        sig=0

        #根据sig变量判断是否接受到相应的信号
        if ((sigThis == sigLeft)); then BoxLeft; GenBox
        elif ((sigThis == sigRight)); then BoxRight; GenBox
        elif ((sigThis == sigDown)); then BoxDown; GenBox
        elif ((sigThis == sigUp)); then BoxUp; GenBox
        fi
    done
}

function rotate90()
{
    for ((i=0;i<4;i++)); do
        for ((j=0;j<4;j++)); do
            map[$i][$j]=${map[$j][((4-$i))]};
        done
    done
}

function BoxLeft()
{
    rotate90
    rotate90
    rotate90
    BoxDown
    rotate90
}

function BoxRight()
{
    rotate90
    BoxDown
    rotate90
    rotate90
    rotate90
}

function BoxUp()
{
    rotate90
    rotate90
    BoxDown
    rotate90
    rotate90
}

function BoxDown()
{
    local num
    for ((i=3;i>=0;i--)); do
        for ((j=0;j<4;j++)); do
            num=$map[$i][$j]
            if [[ $num != 0 ]]; then
                for ((k=(($i+1));k<4;k++)); do
                    if [[ $num == $map[$k][$j] ]]; then
                        (($map[$k][$j]*=2))
                        break
                    fi
                done
            fi
        done
    done
}

#初始绘制
function InitDraw()
{
    clear
    local i t1 t2 t3

    #显示边框
    echo -ne "\033[1m"
    echo -ne "\033[3${cBorder}m\033[4${cBorder}m"

    ((t2 = iLeft + 1))
    ((t3 = iLeft + iTrayWidth * 2 + 3))
    for ((i = 0; i < iTrayHeight; i++))
    do
        ((t1 = i + iTop + 2))
        echo -ne "\033[${t1};${t2}H||"
        echo -ne "\033[${t1};${t3}H||"
    done

    ((t2 = iTop + iTrayHeight + 2))
    for ((i = 0; i < iTrayWidth + 2; i++))
    do
        ((t1 = i * 2 + iLeft + 1))
        echo -ne "\033[${iTrayTop};${t1}H=="
        echo -ne "\033[${t2};${t1}H=="
    done
    echo -ne "\033[0m"


    #显示"Score"和"Level"字样
    echo -ne "\033[1m"
    ((t1 = iLeft + iTrayWidth * 2 + 7))
    ((t2 = iTop + 10))
    echo -ne "\033[3${cScore}m\033[${t2};${t1}HScore"
    ((t2 = iTop + 11))
    echo -ne "\033[3${cScoreValue}m\033[${t2};${t1}H${iScore}"
    ((t2 = iTop + 13))
    echo -ne "\033[3${cScore}m\033[${t2};${t1}HLevel"
    ((t2 = iTop + 14))
    echo -ne "\033[3${cScoreValue}m\033[${t2};${t1}H${iLevel}"
    echo -ne "\033[0m"
}

#退出时显示GameOVer!
function ShowExit()
{
    local y
    ((y = iTrayHeight + iTrayTop + 3))
    echo -e "\033[${y};0HGameOver!\033[0m"
    exit
}

#显示用法.
function Usage()
{
    cat << EOF
Usage: $APP_NAME
Start 2048 game.

-h, --help              display this help and exit
EOF
}


#游戏主程序在这儿开始.
if [[ "$1" == "-h" || "$1" == "--help" ]]; then
    Usage
elif [[ "$1" == "--show" ]]; then
    #当发现具有参数--show时，运行显示函数
    Displayer
else
    bash $0 --show &      #以参数--show将本程序再运行一遍
    KeyReceiver $!        #以上一行产生的进程的进程号作为参数
fi


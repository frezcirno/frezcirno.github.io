import json
from urllib import request, parse, error
from datetime import datetime


def check(token, param: dict = {}):
    '''每日上报'''
    req = request.Request('https://tjxsfw.chisai.tech/api/school_tjxsfw_student/yqfkLogDailyreport/v2')

    req.add_header('User-Agent', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101 Firefox/78.0')
    req.add_header('Accept-Language', 'zh-CN,zh;q=0.8,zh-TW;q=0.7,zh-HK;q=0.5,en-US;q=0.3,en;q=0.2')
    req.add_header('Host', 'tjxsfw.chisai.tech')
    req.add_header('Referer', 'https://servicewechat.com/wx427cf6b5481c866a/27/page-frame.html')
    req.add_header('Authorization', f'Bearer {token}')

    payload = parse.urlencode([
        ('studentPid', param.get('studentPid')),  # pid
        ('studentName', param.get('studentName')),  # 姓名
        ('studentStudentno', param.get('studentStudentno')),  # 学号
        ('studentCollege', param.get('studentCollege', '软件学院')),
        ('locLat', param.get('locLat', '31.37482')),
        ('locLng', param.get('locLng', '121.26621')),
        ('locNation', param.get('locNation', '中国')),
        ('locProvince', param.get('locProvince', '上海市')),
        ('locCity', param.get('locCity', '上海市')),
        ('locDistrict', param.get('locDistrict', '嘉定区')),
        ('healthy', param.get('healthy', '0')),
        ('source', param.get('source', 'weixin,windows')),
        ('reportDatetime', datetime.strftime(datetime.now(), "%Y-%m-%d %H:%M:%S")),
        ('hasMoved', param.get('hasMoved', 'false')),
        ('leaveReason', param.get('leaveReason', '')),
        ('locNation1', param.get('locNation1', '中国')),
        ('locProvince1', param.get('locProvince1', '上海市')),
        ('locCity1', param.get('locCity1', '上海市'))
    ])

    res = None
    try:
        with request.urlopen(req, data=payload.encode()) as f:
            res = json.loads(f.read()) if f.status == 200 else None
    except error.HTTPError as e:
        print("请求失败", e)
    return res


if __name__ == '__main__':
    token = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjEyMzQ1Njc4OSwidXNlcl9uYW1lIjoic3dpZDB4eHh4eHh4eDZjNiIsImF1dGhvcml0aWVzIjpbImFwcF91c2VyIl0sImp0aSI6ImVjY3h4eHgteHh4eC14eHh4LTllN2IteHh4eHhkODRmYjgiLCJjbGllbnRfaWQiOiJhcHAiLCJzY29wZSI6WyJhbGwiXX0.xxxxxxxxxxxxxxxxxxxxxxxxr6d8D4'

    param = {
        'studentPid': '9999999',
        'studentName': '张三',
        'studentStudentno': '1888888'
    }
    res = check(token, param)

    print(res)

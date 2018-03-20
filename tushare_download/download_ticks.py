import tushare as ts

ts.get_industry_classified().to_csv('data/tmp1.csv', index=False, header=False, columns=['code', 'name'])


with open('data/tmp1.csv') as fp:
    for line in fp:
        tushare_code = line.split(",")[0]
        print("writing to: " + tushare_code)
        df = ts.get_k_data(tushare_code)
        df.to_csv('data/tmp2.csv', mode='a', index=False, header=False, columns=['code', 'date', 'open', 'close', 'high', 'low', 'volume'])



#df = ts.get_k_data('600000')
#df.to_csv('tmp3.csv', index=False, header=False, columns=['code', 'date', 'open', 'close', 'high', 'low', 'volume'])

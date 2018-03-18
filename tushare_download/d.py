import tushare as ts
df = ts.get_industry_classified()
df.to_csv('tmp1.csv', index=False, header=False, columns=['code', 'name'])
df = ts.get_k_data('600000')
df.to_csv('tmp2.csv', index=False, header=False, columns=['code', 'date', 'open', 'close', 'high', 'low', 'volume'])

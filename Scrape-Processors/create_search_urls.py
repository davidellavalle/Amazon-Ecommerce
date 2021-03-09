f = open('search_urls.txt', 'w+')
url = 'https://www.amazon.com/s?k=processor&i=electronics-intl-ship&ref=nb_sb_noss_1'
f.write(url)
f.write('\n')


for i in range(2,400):
    url = 'https://www.amazon.com/s?k=processor&i=electronics-intl-ship&page=' + str(i) + '&qid=1611487291&ref=sr_pg_' + str(i)
    f.write(url)
    f.write('\n')

f.close()
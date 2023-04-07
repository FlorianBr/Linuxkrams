#/bin/bash

# Graph partition data: Thumbnail, 24h, 1w, 30d and 1y

# TODO Needs refactoring and deduplication!

WIDTH=320
HEIGHT=240

DrawIt() {
	/usr/bin/rrdtool graph /var/www/html/rrd/${1}_thm.png -s -24h -e now -w 200 -h 120 \
		-l 0 \
		-t "${2}" \
		DEF:size=/root/rrdtool/rrds/${1}.rrd:size:AVERAGE \
		DEF:used=/root/rrdtool/rrds/${1}.rrd:used:AVERAGE \
		LINE1:size#0000FF \
		AREA:size#00FF0030 \
		LINE1:used#800000 \
		AREA:used#FF000080

	/usr/bin/rrdtool graph /var/www/html/rrd/${1}_d.png -s -24h -e now -w ${WIDTH} -h ${HEIGHT} \
		-l 0 \
		-t "${2} - 24h" \
		--watermark "`date`" \
		DEF:size=/root/rrdtool/rrds/${1}.rrd:size:AVERAGE \
		DEF:used=/root/rrdtool/rrds/${1}.rrd:used:AVERAGE \
		LINE1:size#0000FF \
		AREA:size#00FF0030 \
		LINE1:used#800000 \
		AREA:used#FF000080

	/usr/bin/rrdtool graph /var/www/html/rrd/${1}_w.png -s -7d -e now -w ${WIDTH} -h ${HEIGHT} \
		-l 0 \
		-t "${2} - 7d" \
		--watermark "`date`" \
		DEF:size=/root/rrdtool/rrds/${1}.rrd:size:AVERAGE \
		DEF:used=/root/rrdtool/rrds/${1}.rrd:used:AVERAGE \
		LINE1:size#0000FF \
		AREA:size#00FF0030 \
		LINE1:used#800000 \
		AREA:used#FF000080

	/usr/bin/rrdtool graph /var/www/html/rrd/${1}_m.png -s -30d -e now -w ${WIDTH} -h ${HEIGHT} \
		-l 0 \
		-t "${2} - 30d" \
		--watermark "`date`" \
		DEF:size=/root/rrdtool/rrds/${1}.rrd:size:AVERAGE \
		DEF:used=/root/rrdtool/rrds/${1}.rrd:used:AVERAGE \
		LINE1:size#0000FF \
		AREA:size#00FF0030 \
		LINE1:used#800000 \
		AREA:used#FF000080

	/usr/bin/rrdtool graph /var/www/html/rrd/${1}_y.png -s -1y -e now -w ${WIDTH} -h ${HEIGHT} \
		-l 0 \
		-t "${2} - 1y" \
		--watermark "`date`" \
		DEF:size=/root/rrdtool/rrds/${1}.rrd:size:AVERAGE \
		DEF:used=/root/rrdtool/rrds/${1}.rrd:used:AVERAGE \
		LINE1:size#0000FF \
		AREA:size#00FF0030 \
		LINE1:used#800000 \
		AREA:used#FF000080
}

DrawIt sda1 "SDA1 (boot)"
DrawIt sda2 "SDA2 (root)"
DrawIt sdb1 "SDB1 (Data)"


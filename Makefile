# ibus-table-vietnamese makefile
# Copyright (C) 2019  Nguyễn Gia Phong
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

PREFIX ?= /usr/local
DATADIR ?= ${DESTDIR}${PREFIX}/share

all:
	ibus-table-createdb --name=tables/telex.db --source=tables/telex.txt
	ibus-table-createdb --name=tables/vni.db --source=tables/vni.txt

clean:
	rm tables/telex.db
	rm tables/vni.db

install:
	cp tables/telex.db ${DATADIR}/ibus-table/tables/telex.db
	cp icons/telex.png ${DATADIR}/ibus-table/icons/telex.png

	cp tables/vni.db ${DATADIR}/ibus-table/tables/vni.db
	cp icons/vni.png ${DATADIR}/ibus-table/icons/vni.png

uninstall:
	rm ${DATADIR}/ibus-table/tables/telex.db
	rm ${DATADIR}/ibus-table/icons/telex.png

	rm ${DATADIR}/ibus-table/tables/vni.db
	rm ${DATADIR}/ibus-table/icons/vni.png

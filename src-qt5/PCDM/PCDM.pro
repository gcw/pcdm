
TARGET = PCDM-session
target.path=/usr/local/bin
TEMPLATE = app
QT += core widgets x11extras
LIBS += -L/usr/local/lib -lpam -lX11 -lutil
INCLUDEPATH += /usr/local/include

SOURCES += src/main.cpp \
           src/pcdm-gui.cpp \
    	   src/pcdm-backend.cpp \
    	   src/themeStruct.cpp \
           src/pcdm-config.cpp \
	   src/pcdm-xprocess.cpp \
           src/fancySwitcher.cpp \
           src/dialogKeyboard.cpp \
           src/dialogLocale.cpp \
           src/loginWidget.cpp \
           src/capslockindicator.cpp \
	   src/pcdm-logindelay.cpp

HEADERS += src/pcdm-gui.h \
    	   src/pcdm-backend.h \
	   src/themeStruct.h \
	   src/themeItem.h \
           src/pcdm-config.h \
	   src/pcdm-xprocess.h \
           src/fancySwitcher.h \
           src/dialogKeyboard.h \
           src/dialogLocale.h \
           src/loginWidget.h \
           src/capslockindicator.h \
	   src/pcdm-logindelay.h
           
FORMS += src/dialogKeyboard.ui \
	 src/dialogLocale.ui \
	 src/pcdm-logindelay.ui

RESOURCES += PCDM.qrc

TRANSLATIONS =  i18n/PCDM_af.ts \
		i18n/PCDM_ar.ts \
		i18n/PCDM_az.ts \
		i18n/PCDM_bg.ts \
		i18n/PCDM_bn.ts \
		i18n/PCDM_bs.ts \
		i18n/PCDM_ca.ts \
		i18n/PCDM_cs.ts \
		i18n/PCDM_cy.ts \
		i18n/PCDM_da.ts \
		i18n/PCDM_de.ts \
		i18n/PCDM_el.ts \
		i18n/PCDM_es.ts \
		i18n/PCDM_en.ts \
		i18n/PCDM_en_US.ts \
		i18n/PCDM_en_GB.ts \
		i18n/PCDM_en_ZA.ts \
		i18n/PCDM_et.ts \
		i18n/PCDM_eu.ts \
		i18n/PCDM_fa.ts \
		i18n/PCDM_fi.ts \
		i18n/PCDM_fr.ts \
		i18n/PCDM_fr_CA.ts \
		i18n/PCDM_fur.ts \
		i18n/PCDM_gl.ts \
		i18n/PCDM_he.ts \
		i18n/PCDM_hi.ts \
		i18n/PCDM_hr.ts \
		i18n/PCDM_hu.ts \
		i18n/PCDM_id.ts \
		i18n/PCDM_is.ts \
		i18n/PCDM_it.ts \
		i18n/PCDM_ja.ts \
		i18n/PCDM_ka.ts \
		i18n/PCDM_ko.ts \
		i18n/PCDM_lt.ts \
		i18n/PCDM_lv.ts \
		i18n/PCDM_mk.ts \
		i18n/PCDM_mn.ts \
		i18n/PCDM_ms.ts \
		i18n/PCDM_mt.ts \
		i18n/PCDM_nb.ts \
		i18n/PCDM_ne.ts \
		i18n/PCDM_nl.ts \
		i18n/PCDM_pa.ts \
		i18n/PCDM_pl.ts \
		i18n/PCDM_pt.ts \
		i18n/PCDM_pt_BR.ts \
		i18n/PCDM_ro.ts \
		i18n/PCDM_ru.ts \
		i18n/PCDM_sa.ts \
		i18n/PCDM_sk.ts \
		i18n/PCDM_sl.ts \
		i18n/PCDM_sr.ts \
		i18n/PCDM_sv.ts \
		i18n/PCDM_sw.ts \
		i18n/PCDM_ta.ts \
		i18n/PCDM_tg.ts \
		i18n/PCDM_th.ts \
		i18n/PCDM_tr.ts \
		i18n/PCDM_uk.ts \
		i18n/PCDM_ur.ts \
		i18n/PCDM_uz.ts \
		i18n/PCDM_vi.ts \
		i18n/PCDM_zh_CN.ts \
		i18n/PCDM_zh_HK.ts \
		i18n/PCDM_zh_TW.ts \
		i18n/PCDM_zu.ts

isEmpty(LRELEASE){ LRELEASE = $$[QT_INSTALL_BINS]/lrelease }

dotrans.path=/usr/local/share/PCDM/i18n/
dotrans.extra=cd i18n && $${LRELEASE} -nounfinished *.ts && cp *.qm $(INSTALL_ROOT)/usr/local/share/PCDM/i18n/

conf=pcdm.conf
conf.path=/usr/local/etc
conf.extra=cp pcdm.conf $(INSTALL_ROOT)/usr/local/etc/pcdm.conf.dist && chmod 600 $(INSTALL_ROOT)/usr/local/etc/pcdm.conf.dist

session.path=/usr/local/share/PCDM
session.extra=cc -o pcdm-session src/pcdm-session.c && strip pcdm-session && install -m 755 pcdm-session $(INSTALL_ROOT)/usr/local/share/PCDM/

startpico.path=/usr/local/bin
startpico.extra=install -m 755 src/start-pcdm-pico $(INSTALL_ROOT)/usr/local/bin

picosudo.path=/usr/local/etc/sudoers.d/
picosudo.extra=install -m 644 src/pico-sudoers $(INSTALL_ROOT)/usr/local/etc/sudoers.d/

INSTALLS += target session conf dotrans startpico picosudo

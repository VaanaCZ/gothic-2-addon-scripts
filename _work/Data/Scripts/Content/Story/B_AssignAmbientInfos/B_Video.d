// *********************************
// Sprachausgabe der Video-Sequenzen
// *********************************

func void B_Video()
{
	// ------ Intro ------
	AI_Output (self, other, "INTRO_Xardas_Speech_14_00"); //Jedin� v�ze� dok�zal zm�nit osud stovky ostatn�ch.
	AI_Output (self, other, "INTRO_Xardas_Speech_14_01"); //Zaplatil za to v�ak vysokou cenu.
	AI_Output (self, other, "INTRO_Xardas_Speech_14_02"); //Porazil Sp��e, zni�il bari�ru...
	AI_Output (self, other, "INTRO_Xardas_Speech_14_03"); //...ale zat�mco ostatn� v�zni uprchli, on z�stal pod hromadou suti.
	AI_Output (self, other, "INTRO_Xardas_Speech_14_04"); //Byl jsem to j�, kdo jej vyslal proti Sp��i.
	AI_Output (self, other, "INTRO_Xardas_Speech_14_05"); //A jsem to op�t j�, kdo jej p�iv�d� zp�t.
	AI_Output (self, other, "INTRO_Xardas_Speech_14_06"); //Je slab� a mnoh� zapomn�l.
	AI_Output (self, other, "INTRO_Xardas_Speech_14_07"); //Ale je na�ivu...
	AI_Output (self, other, "INTRO_Xardas_Speech_14_08"); //Je zp�tky!
	
	// ------ Lagerfeuer ------
	AI_Output (self, other, "INTRO_DiegoGorn_12_00"); //(u ohn�) Samoz�ejm� �e �ije. Cos myslel?
	AI_Output (self, other, "INTRO_DiegoGorn_11_01"); //Doufejme, �e...
	AI_Output (self, other, "INTRO_DiegoGorn_12_02"); //(zachv�n� zem�) C�tils to taky?
	AI_Output (self, other, "INTRO_DiegoGorn_11_03"); //Co?
	AI_Output (self, other, "INTRO_DiegoGorn_12_04"); //Zem�...
	
	
	// ------ Extro ------
	AI_Output (other, self, "Extro_Tempel_15_01"); //(u�asle) Xardasi! Co...
	AI_Output (other, self, "Extro_Tempel_14_02"); //(na��kav�) Te� ne...
	AI_Output (other, self, "Extro_Tempel_14_03"); //(fanaticky) Jsem p�ipraven... zvol m�! Ano...
	AI_Output (other, self, "Extro_Tempel_15_04"); //(pro sebe) Kde je?
	
	// ------ Outro ------
	AI_Output (self, other, "OUTRO_Xardas_14_00"); //(cituje) A �lov�k zabil bestii a ta sestoupila do Beliarovy ��e...
	AI_Output (other, self, "OUTRO_Xardas_15_01"); //Xardasi! Co se vlastn� p�esn� stalo v Irdorathsk�m chr�mu?
	AI_Output (self, other, "OUTRO_Xardas_14_02"); //S Innosovou pomoc� jsi porazil zt�lesn�n� zla.
	AI_Output (self, other, "OUTRO_Xardas_14_03"); //A j� si vzal jeho moc.
	AI_Output (self, other, "OUTRO_Xardas_14_04"); //Byl to m�j jedin� c�l od chv�le, co jsem opustil kruh ohn�.
	AI_Output (self, other, "OUTRO_Xardas_14_05"); //Abych ho dos�hl, pom�hal jsem ti v cest� za tv�m c�lem.
	AI_Output (self, other, "OUTRO_Xardas_14_06"); //Co mi bylo zapov�zeno v chr�mu Sp��e, se te� kone�n� naplnilo.
	AI_Output (self, other, "OUTRO_Xardas_14_07"); //Beliar si vybral m�.
	AI_Output (other, self, "OUTRO_Xardas_15_08"); //Tak to te� naslouch� bohu zla?
	AI_Output (self, other, "OUTRO_Xardas_14_09"); //Ne. Neslou��m Beliarovi o nic v�c, ne� ty naslouch� Innosovi!
	AI_Output (self, other, "OUTRO_Xardas_14_10"); //Ani bohov� sami nev�d�, jak� osud je n�m p�edur�en.
	AI_Output (self, other, "OUTRO_Xardas_14_11"); //A j� teprve te� za��n�m ch�pat, jak� cesty se mi za��naj� otev�rat.
	AI_Output (self, other, "OUTRO_Xardas_14_12"); //Ale jedna v�c je jist�. Je�t� se uvid�me...
	
	// ------ Outro Xardas Kapit�n ------
	AI_Output (self, other, "OUTRO_Xardas_04_00"); //(vol�) Vyplouv�me!
	
	// ------ Drachenangriff ------
	AI_Output (self, other, "Cutscene_Drachen_04_00"); //(d�v� se do d�lky, n�co vid�) Hmmm?
	AI_Output (self, other, "Cutscene_Drachen_04_01"); //(huh��) A do hajzlu!
	AI_Output (self, other, "Cutscene_Drachen_04_02"); //(ka�le, d�v�) - (r�zn�)
	AI_Output (self, other, "Cutscene_Drachen_04_03"); //Aaaargh! (r�zn�)
	AI_Output (self, other, "Cutscene_Drachen_04_04"); //(t�hl� smrteln� v�k�ik, 4 sekundy)
	
	// ------ OrkSturm ------
	AI_Output (self, other, "Cutscene_OrcSturm_04_00"); //Zav�ete br�nu!!! (r�zn�)
	AI_Output (self, other, "Cutscene_OrcSturm_04_01"); //Zastavte je!!! (r�zn�)
	AI_Output (self, other, "Cutscene_OrcSturm_04_02"); //Aaaargh! (r�zn�)
	
	// ------ Outro Credits ------
	AI_Output (self, other, "OUTRO_Schiff_12_00"); //Jsme p�et�eni. M�li bychom n�jak� zlato shodit p�es palubu.
	AI_Output (other, self, "OUTRO_Schiff_15_01"); //Dej od toho zlata pracky pry�!
	AI_Output (self, other, "OUTRO_Schiff_12_02"); //Hele, v�n� by bylo lep��, kdyby...
	AI_Output (other, self, "OUTRO_Schiff_15_03"); //U� o tom nechci sly�et.
	AI_Output (self, other, "OUTRO_Schiff_11_04"); //Sly�el jsem, �e se v�lka se sk�ety vyv�j� �patn�.
	AI_Output (other, self, "OUTRO_Schiff_15_05"); //A?
	AI_Output (self, other, "OUTRO_Schiff_11_06"); //Nejsp� nebude v�echno to zlato kde utratit.
	AI_Output (other, self, "OUTRO_Schiff_15_07"); //To zlato z�stane na palub�!
	AI_Output (self, other, "OUTRO_Schiff_12_08"); //K �emu n�m bude zlato, kdy� v prvn� bou�i p�jdeme ke dnu?
	AI_Output (other, self, "OUTRO_Schiff_15_09"); //Ale j� ��dnou bou�i nevid�m.
	AI_Output (self, other, "OUTRO_Schiff_12_10"); //Zat�m...
	AI_Output (other, self, "OUTRO_Schiff_15_11"); //Kl�dek! V�echno dob�e dopadne!
	
	//ADDON
	AI_Output	(other, self, "DIA_Addon_AddonIntro_15_00"); //(udiven�) ...lid�?
	AI_Output	(self, other, "DIA_Addon_AddonIntro_14_01"); //(opovr�liv�) Lid� jsou slab�.
	AI_Output	(self, other, "DIA_Addon_AddonIntro_14_02"); //(opovr�liv�) P��li� snadno podl�haj� poku�en�m.
	AI_Output	(self, other, "DIA_Addon_AddonIntro_14_03"); //A tak si obvykle zahr�vaj� se silami, kter�m nerozum�j� a je� nedok�ou ovl�dat.
	AI_Output	(self, other, "DIA_Addon_AddonIntro_14_04"); //Ti, kdo� ve sv� v��e je�t� nezakol�sali, u� za�ali bojovat s nep��telem.
	
	//ADDON - NEU
	AI_Output	(self, other, "DIA_Addon_Xardas_AddonIntro_Add_14_00"); //Po p�du bari�ry a osvobozen� Sp��e Beliar�v hn�v je�t� vzrostl.
	AI_Output	(self, other, "DIA_Addon_Xardas_AddonIntro_Add_14_01"); //Jak se p�e ve star�ch posv�tn�ch knih�ch, do tohoto sv�ta se vr�t� mocn� artefakt.
	AI_Output	(self, other, "DIA_Addon_Xardas_AddonIntro_Add_14_02"); //(cituje) 'Kdy� b�h temnot vyslal na pr�zkum sv� slu�ebn�ky.'
	AI_Output	(self, other, "DIA_Addon_Xardas_AddonIntro_Add_14_03"); //A pr�v� to se zrovna stalo. 
	AI_Output	(self, other, "DIA_Addon_Xardas_AddonIntro_Add_14_04"); //To hled�n� u� za�alo d�vno!
	AI_Output	(self, other, "DIA_Addon_Xardas_AddonIntro_Add_14_05"); //Beliarovi slu�ebn�ci p�i sv�m p�tr�n� znesv�cuj� nejstar�� bo�� svatyn�.
	AI_Output	(self, other, "DIA_Addon_Xardas_AddonIntro_Add_14_06"); //Beliarovi slu�ebn�ci znesv�cuj� nejstar�� bo�� svatyn�.
	AI_Output	(self, other, "DIA_Addon_Xardas_AddonIntro_Add_14_07"); //A tak se probudili str�ci t�chto posv�tn�ch m�st. To jejich hn�v ot��s� zem�!
	AI_Output	(self, other, "DIA_Addon_Xardas_AddonIntro_Add_14_08"); //Ten hn�v c�t� ka�d� mocn�j�� m�g na tomto ostrov�. 
	AI_Output	(self, other, "DIA_Addon_Xardas_AddonIntro_Add_14_09"); //A n�kte�� u� se pokusili t� hrozb� �elit.
};

///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_AngarDJG_EXIT   (C_INFO)
{
	npc         = DJG_705_Angar;
	nr          = 999;
	condition   = DIA_AngarDJG_EXIT_Condition;
	information = DIA_AngarDJG_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_AngarDJG_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_AngarDJG_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_AngarDJG_HALLO		(C_INFO)
{
	npc		 = 	DJG_705_Angar;
	nr		 = 	5;
	condition	 = 	DIA_AngarDJG_HALLO_Condition;
	information	 = 	DIA_AngarDJG_HALLO_Info;

	description	 = 	"Nezn�me se?";
};

func int DIA_AngarDJG_HALLO_Condition ()
{
	return TRUE;
};

func void DIA_AngarDJG_HALLO_Info ()
{
	AI_Output			(other, self, "DIA_AngarDJG_HALLO_15_00"); //Nezn�me se? Ty jsi Cor Angar. B�val jsi templ��em v t�bo�e v ba�in�ch.
	AI_Output			(self, other, "DIA_AngarDJG_HALLO_04_01"); //(rezignovan�) ��kej mi Angar. Ten titul u� nepou��v�m. Sp��ovo bratrstvo u� neexistuje.
	AI_Output			(self, other, "DIA_AngarDJG_HALLO_04_02"); //Zaj�mav�, ale vypad� to, jako bys m� u� odn�kud znal. N�jak si t� nemohu vybavit.
	AI_Output			(other, self, "DIA_AngarDJG_HALLO_15_03"); //Co to s tebou je?
	AI_Output			(self, other, "DIA_AngarDJG_HALLO_04_04"); //(p�ehl�iv�) Ale, sv�ho �asu jsem v�bec nemohl sp�t. Po��d jsem m�l no�n� m�ry.
	B_LogEntry (TOPIC_Dragonhunter,"V Hornick�m �dol� jsem na�el Angara.");
};


///////////////////////////////////////////////////////////////////////
//	B_SCTellsAngarAboutMadPsi
///////////////////////////////////////////////////////////////////////
func void B_SCTellsAngarAboutMadPsi ()
{	
	if (Angar_KnowsMadPsi == FALSE)
	{
		AI_Output			(other, self, "DIA_Angar_B_SCTellsAngarAboutMadPsi_15_00"); //Sp��ovo bratrstvo si zotro�ilo zlo.
		AI_Output			(other, self, "DIA_Angar_B_SCTellsAngarAboutMadPsi_15_01"); //Tv� d��v�j�� p��tel� ze star�ho t�bora proch�zej� zem� v �ern�ch r�b�ch a vypadaj�, �e je v�echno, co se h�be, neskute�n� �tve.
		AI_Output			(self, other, "DIA_Angar_B_SCTellsAngarAboutMadPsi_04_02"); //O �em to mluv�?
	};
};

func void B_SCTellsAngarAboutMadPsi2 ()
{	
	if (Angar_KnowsMadPsi == FALSE)
	{
		AI_Output			(other, self, "DIA_Angar_B_SCTellsAngarAboutMadPsi2_15_00"); //Slou�� nep��teli a nejsou ni��m jin�m ne� bezduch�mi bojovn�ky zla.
		AI_Output			(self, other, "DIA_Angar_B_SCTellsAngarAboutMadPsi2_04_01"); //U v�ech boh�. V�d�t to, nebyl bych tak zaslepen�m. U� se to v�ckr�t nestane, P��sah�m.
		B_GivePlayerXP (XP_Angar_KnowsMadPsi);
		Angar_KnowsMadPsi = TRUE;
	};
};


///////////////////////////////////////////////////////////////////////
//	Info Wiekommstduhierher
///////////////////////////////////////////////////////////////////////
instance DIA_Angar_WIEKOMMSTDUHIERHER		(C_INFO)
{
	npc		 = 	DJG_705_Angar;
	nr		 = 	6;
	condition	 = 	DIA_Angar_WIEKOMMSTDUHIERHER_Condition;
	information	 = 	DIA_Angar_WIEKOMMSTDUHIERHER_Info;

	description	 = 	"Jak ses sem dostal?";
};

func int DIA_Angar_WIEKOMMSTDUHIERHER_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_AngarDJG_HALLO))
		{
				return TRUE;
		};
};

func void DIA_Angar_WIEKOMMSTDUHIERHER_Info ()
{
	AI_Output			(other, self, "DIA_Angar_WIEKOMMSTDUHIERHER_15_00"); //Jak ses sem dostal?
	AI_Output			(self, other, "DIA_Angar_WIEKOMMSTDUHIERHER_04_01"); //Pot�, co zanikla bari�ra, jsem se ukryl v hor�ch. Pak bylo na�ase, abych za�al n�co d�lat.
	AI_Output			(self, other, "DIA_Angar_WIEKOMMSTDUHIERHER_04_02"); //Bloudil jsem n�kolik dn� a pak jsem se n�hle objevil na tomhle hrad�. Neptej se m�, co se stalo. J� to nev�m.
	AI_Output			(self, other, "DIA_Angar_WIEKOMMSTDUHIERHER_04_03"); //A jako by toho bylo m�lo, je�t� jsem ztratil amulet, kter� jsem m�l u� dlouh� l�ta. Nejsp� se zbl�zn�m, kdy� se mi ho nepoda�� znovu nal�zt.

	Log_CreateTopic (TOPIC_AngarsAmulett, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_AngarsAmulett, LOG_RUNNING);
	B_LogEntry (TOPIC_AngarsAmulett,"Angar ztratil sv�j amulet a te� se jej zoufale sna�� naj�t."); 


	Info_AddChoice	(DIA_Angar_WIEKOMMSTDUHIERHER, DIALOG_BACK, DIA_Angar_WIEKOMMSTDUHIERHER_gehen );
	Info_AddChoice	(DIA_Angar_WIEKOMMSTDUHIERHER, "Kde p�esn� jsi ten amulet ztratil?", DIA_Angar_WIEKOMMSTDUHIERHER_amulett );

	if (SC_KnowsMadPsi == TRUE)
	{
	Info_AddChoice	(DIA_Angar_WIEKOMMSTDUHIERHER, "Sp��ovo bratrstvo si zotro�ilo zlo.", DIA_Angar_WIEKOMMSTDUHIERHER_andere );
	}
	else
	{
	Info_AddChoice	(DIA_Angar_WIEKOMMSTDUHIERHER, "Co se stalo s ostatn�ma z t�bora v ba�in�ch?", DIA_Angar_WIEKOMMSTDUHIERHER_andere );
	};

	if (DJG_Angar_SentToStones == FALSE)
	{
	Info_AddChoice	(DIA_Angar_WIEKOMMSTDUHIERHER, "Co bude� d�lat d�l?", DIA_Angar_WIEKOMMSTDUHIERHER_nun );
	};
};
func void DIA_Angar_WIEKOMMSTDUHIERHER_amulett ()
{
	AI_Output			(other, self, "DIA_Angar_WIEKOMMSTDUHIERHER_amulett_15_00"); //Kde p�esn� jsi ten amulet ztratil?

	if (DJG_Angar_SentToStones ==FALSE)
	{
		AI_Output			(self, other, "DIA_Angar_WIEKOMMSTDUHIERHER_amulett_04_01"); //N�kde na jihu, kr�tce p�edt�m, ne� jsem se objevil tady na hrad�.
		B_LogEntry (TOPIC_AngarsAmulett,"Amulet by m�l le�et kdesi na jihu. Angar se po n�m jde pod�vat."); 
	}
	else
	{
		AI_Output			(self, other, "DIA_Angar_WIEKOMMSTDUHIERHER_amulett_04_02"); //N�kde mus� b�t.
		B_LogEntry (TOPIC_AngarsAmulett,"Amulet se nach�z� u kamenn� hrobky na jihu Hornick�ho �dol�."); 
	};
	AI_Output			(self, other, "DIA_Angar_WIEKOMMSTDUHIERHER_amulett_04_03"); //Boj�m se, �e ho n�kdo ukradl. Mus�m ho za ka�dou cenu dostat zp�tky.
};

func void DIA_Angar_WIEKOMMSTDUHIERHER_andere ()
{
	if (SC_KnowsMadPsi == TRUE)
	{
		B_SCTellsAngarAboutMadPsi ();
	}
	else
	{
		AI_Output			(other, self, "DIA_Angar_WIEKOMMSTDUHIERHER_andere_15_00"); //Co se stalo s ostatn�ma z t�bora v ba�in�ch?
	};
	
	AI_Output			(self, other, "DIA_Angar_WIEKOMMSTDUHIERHER_andere_04_01"); //Posledn� v�c, na kterou si pamatuju, bylo zni�en� bari�ry a nervy dr�saj�c� jekot, kter� ho doprov�zel.
	AI_Output			(self, other, "DIA_Angar_WIEKOMMSTDUHIERHER_andere_04_02"); //V panick� hr�ze jsme se vrhli k zemi a sv�jeli se bolest�. Ten zvuk. A po��d s�lil.
	AI_Output			(self, other, "DIA_Angar_WIEKOMMSTDUHIERHER_andere_04_03"); //A pak, kdy� bylo po v�em, se v�ichni zbl�znili a s hlasit�m �evem zmizeli ve tm�.
	AI_Output			(self, other, "DIA_Angar_WIEKOMMSTDUHIERHER_andere_04_04"); //Pak u� jsem je nikdy nevid�l.
	
	if (SC_KnowsMadPsi == TRUE)
	{
		B_SCTellsAngarAboutMadPsi2 ();
	};
};

func void DIA_Angar_WIEKOMMSTDUHIERHER_nun ()
{
	AI_Output			(other, self, "DIA_Angar_WIEKOMMSTDUHIERHER_nun_15_00"); //Co chce� d�lat d�l?
	AI_Output			(self, other, "DIA_Angar_WIEKOMMSTDUHIERHER_nun_04_01"); //Nejd��v jsem si musel trochu odpo�inout, abych mohl za��t hledat sv�j ztracen� amulet.
	AI_Output			(self, other, "DIA_Angar_WIEKOMMSTDUHIERHER_nun_04_02"); //Zaslechl jsem n�co o drac�ch.
	AI_Output			(self, other, "DIA_Angar_WIEKOMMSTDUHIERHER_nun_04_03"); //Tak� se pov�d�, �e se do Hornick�ho �dol� vydalo mnoho bojovn�k� na jejich lov.
	AI_Output			(self, other, "DIA_Angar_WIEKOMMSTDUHIERHER_nun_04_04"); //Uva�uju o tom, �e bych se k nim p�idal.

	Angar_willDJGwerden = TRUE;

};

func void DIA_Angar_WIEKOMMSTDUHIERHER_gehen ()
{
	Info_ClearChoices	(DIA_Angar_WIEKOMMSTDUHIERHER);
};

///////////////////////////////////////////////////////////////////////
//	Info SCTellsAngarAboutMadPsi2
///////////////////////////////////////////////////////////////////////
instance DIA_Angar_SCTellsAngarAboutMadPsi2		(C_INFO)
{
	npc		 = 	DJG_705_Angar;
	nr		 = 	7;
	condition	 = 	DIA_Angar_SCTellsAngarAboutMadPsi2_Condition;
	information	 = 	DIA_Angar_SCTellsAngarAboutMadPsi2_Info;

	description	 = 	"Sp��ovo bratrstvo si zotro�ilo zlo."; //Joly: falls erst nach DIA_Angar_WIEKOMMSTDUHIERHER  (SC_KnowsMadPsi == TRUE)
};

func int DIA_Angar_SCTellsAngarAboutMadPsi2_Condition ()
{
	if (SC_KnowsMadPsi == TRUE)
	&& (Angar_KnowsMadPsi == FALSE)
	&& (Npc_KnowsInfo(other, DIA_Angar_WIEKOMMSTDUHIERHER))
		{
				return TRUE;
		};
};

func void DIA_Angar_SCTellsAngarAboutMadPsi2_Info ()
{
	B_SCTellsAngarAboutMadPsi ();
	B_SCTellsAngarAboutMadPsi2 ();
};

///////////////////////////////////////////////////////////////////////
//	Info FoundAmulett
///////////////////////////////////////////////////////////////////////
instance DIA_Angar_FOUNDAMULETT		(C_INFO)
{
	npc		 = 	DJG_705_Angar;
	nr		 = 	7;
	condition	 = 	DIA_Angar_FOUNDAMULETT_Condition;
	information	 = 	DIA_Angar_FOUNDAMULETT_Info;

	description	 = 	"Na�el jsem tv�j amulet.";
};

func int DIA_Angar_FOUNDAMULETT_Condition ()
{
	if 	(Npc_HasItems (other,ItAm_Mana_Angar_MIS))
		&& (Npc_KnowsInfo(other, DIA_Angar_WIEKOMMSTDUHIERHER))
		{
				return TRUE;
		};
};

func void B_AngarsAmulettAbgeben()
{
	AI_Output			(other, self, "DIA_Angar_FOUNDAMULETT_15_00"); //Na�el jsem tv�j amulet.
	AI_Output			(self, other, "DIA_Angar_FOUNDAMULETT_04_01"); //D�ky. Myslel jsem, �e u� ho nikdy neuvid�m.

	B_GiveInvItems (other, self, ItAm_Mana_Angar_MIS,1);
	
	DJG_AngarGotAmulett = TRUE;
	B_GivePlayerXP (XP_AngarDJGUndeadMage); 
};

func void DIA_Angar_FOUNDAMULETT_Info ()
{
	B_AngarsAmulettAbgeben ();

	Info_AddChoice	(DIA_Angar_FOUNDAMULETT, "Pro� je pro tebe tak d�le�it�?", DIA_Angar_FOUNDAMULETT_besonders );
	Info_AddChoice	(DIA_Angar_FOUNDAMULETT, "Co bude� d�lat te�?", DIA_Angar_FOUNDAMULETT_nun );
};

func void DIA_Angar_FOUNDAMULETT_besonders ()
{
	AI_Output			(other, self, "DIA_Angar_FOUNDAMULETT_besonders_15_00"); //Pro� je pro tebe tak d�le�it�?
	AI_Output			(self, other, "DIA_Angar_FOUNDAMULETT_besonders_04_01"); //Byl to d�rek.
	AI_Output			(other, self, "DIA_Angar_FOUNDAMULETT_besonders_15_02"); //Aha.


};

func void DIA_Angar_FOUNDAMULETT_nun ()
{
	AI_Output			(other, self, "DIA_Angar_FOUNDAMULETT_nun_15_00"); //Co bude� d�lat te�?
	AI_Output			(self, other, "DIA_Angar_FOUNDAMULETT_nun_04_01"); //Vypadnu z tohodle zatracen�ho �dol�.
	AI_Output			(self, other, "DIA_Angar_FOUNDAMULETT_nun_04_02"); //Mo�n� se je�t� n�kdy setk�me. Sbohem.

	AI_StopProcessInfos (self);
	if 	((Npc_GetDistToWP(self,"OC_TO_MAGE")<1000) == FALSE) //Joly: Damit Angar nicht am OC Tor rumkronkelt, wenn er noch im OC ist.
	{ 
		Npc_ExchangeRoutine	(self,"LeavingOW");
	};
};

///////////////////////////////////////////////////////////////////////
//	Info DJG_Anwerben
///////////////////////////////////////////////////////////////////////
instance DIA_Angar_DJG_ANWERBEN		(C_INFO)
{
	npc		 = 	DJG_705_Angar;
	nr		 = 	8;
	condition	 = 	DIA_Angar_DJG_ANWERBEN_Condition;
	information	 = 	DIA_Angar_DJG_ANWERBEN_Info;

	description	 = 	"Mo�n� bych ti mohl pomoct s nalezen�m toho amuletu.";
};

func int DIA_Angar_DJG_ANWERBEN_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Angar_WIEKOMMSTDUHIERHER))
		&& (DJG_AngarGotAmulett == FALSE)
		{
				return TRUE;
		};
};

func void DIA_Angar_DJG_ANWERBEN_Info ()
{
	AI_Output			(other, self, "DIA_Angar_DJG_ANWERBEN_15_00"); //Mo�n� bych ti mohl pomoct s nalezen�m toho amuletu.
	AI_Output			(self, other, "DIA_Angar_DJG_ANWERBEN_04_01"); //Pro� ne. Trocha pomoci nem��e �kodit.


	if (DJG_Angar_SentToStones == FALSE)
		{
		Info_AddChoice	(DIA_Angar_DJG_ANWERBEN, "U� mus�m j�t.", DIA_Angar_DJG_ANWERBEN_gehen );
		Info_AddChoice	(DIA_Angar_DJG_ANWERBEN, "Kam chce� vyrazit?", DIA_Angar_DJG_ANWERBEN_wo );
		Info_AddChoice	(DIA_Angar_DJG_ANWERBEN, "Kdy p�jde�?", DIA_Angar_DJG_ANWERBEN_wann );
		};
	
	if (Angar_willDJGwerden == TRUE)
		{
		Info_AddChoice	(DIA_Angar_DJG_ANWERBEN, "A co drakobijci?", DIA_Angar_DJG_ANWERBEN_DJG );
		};
};
func void DIA_Angar_DJG_ANWERBEN_DJG ()
{
	AI_Output			(other, self, "DIA_Angar_DJG_ANWERBEN_DJG_15_00"); //Co ti drakobijci?
	AI_Output			(self, other, "DIA_Angar_DJG_ANWERBEN_DJG_04_01"); //Promluv�m si s nimi pozd�ji. Mo�n� se jim moje siln� pa�e budou hodit.

};

func void DIA_Angar_DJG_ANWERBEN_wann ()
{
	AI_Output			(other, self, "DIA_Angar_DJG_ANWERBEN_wann_15_00"); //Kdy p�jde�?
	AI_Output			(self, other, "DIA_Angar_DJG_ANWERBEN_wann_04_01"); //Jakmile mi bude l�p.
};

func void DIA_Angar_DJG_ANWERBEN_wo ()
{
	AI_Output			(other, self, "DIA_Angar_DJG_ANWERBEN_wo_15_00"); //Kam chce� vyrazit?
	AI_Output			(self, other, "DIA_Angar_DJG_ANWERBEN_wo_04_01"); //M�l bych se vydat na jih, tam, co jsem byl naposled.
	AI_Output			(self, other, "DIA_Angar_DJG_ANWERBEN_wo_04_02"); //Je tam jeskynn� hrob, obklopen� balvany.

};
func void DIA_Angar_DJG_ANWERBEN_gehen ()
{
	AI_Output			(other, self, "DIA_Angar_DJG_ANWERBEN_gehen_15_00"); //U� mus�m j�t.
	AI_Output			(self, other, "DIA_Angar_DJG_ANWERBEN_gehen_04_01"); //Bu� opatrn�.
	
	AI_StopProcessInfos (self);
};




///////////////////////////////////////////////////////////////////////
//	Info Wasmachstdu
///////////////////////////////////////////////////////////////////////
instance DIA_AngarDJG_WASMACHSTDU		(C_INFO)
{
	npc		 = 	DJG_705_Angar;
	nr		 = 	9;
	condition	 = 	DIA_AngarDJG_WASMACHSTDU_Condition;
	information	 = 	DIA_AngarDJG_WASMACHSTDU_Info;

	description	 = 	"Stalo se n�co?";
};

func int DIA_AngarDJG_WASMACHSTDU_Condition ()
{
	if 	(
		(Npc_GetDistToWP(self,"OW_DJG_WATCH_STONEHENGE_01")<8000) 
		&&	(Npc_KnowsInfo(other, DIA_Angar_DJG_ANWERBEN)) 
		&& (DJG_AngarGotAmulett == FALSE)
		)
			{
				return TRUE;
			};
};

func void DIA_AngarDJG_WASMACHSTDU_Info ()
{
	AI_Output			(other, self, "DIA_AngarDJG_WASMACHSTDU_15_00"); //N�co je �patn�?
	AI_Output			(self, other, "DIA_AngarDJG_WASMACHSTDU_04_01"); //Sly�els to? Je�t� nikdy jsem v cel�m sv�m �ivot� nesly�el tak p��ern� zvuk!
	AI_Output			(other, self, "DIA_AngarDJG_WASMACHSTDU_15_02"); //Co mysl�? Nesly�el jsem ani hl�sku!
	AI_Output			(self, other, "DIA_AngarDJG_WASMACHSTDU_04_03"); //Cel� tahle oblast p�chne smrt� a zk�zou. Ta zahn�vaj�c� stvo�en� hl�daj� skaln� p��stup do krypty, tam p�ed n�mi.
	AI_Output			(self, other, "DIA_AngarDJG_WASMACHSTDU_04_04"); //Skr�v� se tam n�co p��ern�ho a vys�l� to sv� nohsledy na povrch zem�.
	AI_Output			(self, other, "DIA_AngarDJG_WASMACHSTDU_04_05"); //Jsem si t�m�� jist�, �e jsem ten amulet ztratil n�kde tady.

	if (Angar_willDJGwerden == TRUE)
	{
	Info_AddChoice	(DIA_AngarDJG_WASMACHSTDU, "Mluvil jsi s drakobijci?", DIA_AngarDJG_WASMACHSTDU_DJG );
	};
};
func void DIA_AngarDJG_WASMACHSTDU_DJG ()
{
	AI_Output			(other, self, "DIA_AngarDJG_WASMACHSTDU_DJG_15_00"); //Mluvil jsi s drakobijci?
	AI_Output			(self, other, "DIA_AngarDJG_WASMACHSTDU_DJG_04_01"); //Ano. Ale o�ek�val jsem spole�enstvo podobn� tomu, co jsme m�li v t�bo�e v ba�in�ch.
	AI_Output			(self, other, "DIA_AngarDJG_WASMACHSTDU_DJG_04_02"); //Ti chlapi ale nejsou nic v�c ne� jen divok� nesourod� sb�rka naprost�ch pitomc�. To nen� nic pro m�.
};


///////////////////////////////////////////////////////////////////////
//	Info WhatsInThere
///////////////////////////////////////////////////////////////////////
instance DIA_AngarDJG_WHATSINTHERE		(C_INFO)
{
	npc		 = 	DJG_705_Angar;
	nr		 = 	10;
	condition	 = 	DIA_AngarDJG_WHATSINTHERE_Condition;
	information	 = 	DIA_AngarDJG_WHATSINTHERE_Info;

	description	 = 	"Co se skr�v� v t� jeskyni ve skal�ch?";
};

func int DIA_AngarDJG_WHATSINTHERE_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_AngarDJG_WASMACHSTDU))
		&& (DJG_AngarGotAmulett == FALSE)
		{
				return TRUE;
		};
};

func void DIA_AngarDJG_WHATSINTHERE_Info ()
{
	AI_Output			(other, self, "DIA_AngarDJG_WHATSINTHERE_15_00"); //Co se skr�v� v t� jeskyni ve skal�ch?
	AI_Output			(self, other, "DIA_AngarDJG_WHATSINTHERE_04_01"); //N�co mi nechce dovolit se k t� jeskyni p�ibl�it!
	AI_Output			(self, other, "DIA_AngarDJG_WHATSINTHERE_04_02"); //St�e�� ji magick� stvo�en�. Vid�l jsem je v noci, jak prohled�vaj� okol�. Nechutnost sama.
	AI_Output			(self, other, "DIA_AngarDJG_WHATSINTHERE_04_03"); //Obr�tila se nazp�t a zmizela mezi stromy. A tys m�l pocit, jako by vys�la v�echen �ivot z okol� jako houba vys�v� vodu.

	//Log_AddEntry (TOPIC_Dragonhunter,"Ich habe Angar im Minental gefunden. Er vermutet, da� sich in der Felsengruft, wo er sich aufh�lt, ein Drache befindet, der hier seine untoten Helfer an die Oberfl�che entsendet.");
	B_LogEntry (TOPIC_Dragonhunter,"V Hornick�m �dol� jsem na�el Angara.");
};

///////////////////////////////////////////////////////////////////////
//	Info WantToGoInThere
///////////////////////////////////////////////////////////////////////
instance DIA_AngarDJG_WANTTOGOINTHERE		(C_INFO)
{
	npc		 = 	DJG_705_Angar;
	nr		 = 	11;
	condition	 = 	DIA_AngarDJG_WANTTOGOINTHERE_Condition;
	information	 = 	DIA_AngarDJG_WANTTOGOINTHERE_Info;

	description	 = 	"Poj�me spolu.";
};

func int DIA_AngarDJG_WANTTOGOINTHERE_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_AngarDJG_WHATSINTHERE))
		&& (DJG_AngarGotAmulett == FALSE)
		{
				return TRUE;
		};
};

func void DIA_AngarDJG_WANTTOGOINTHERE_Info ()
{
	AI_Output			(other, self, "DIA_AngarDJG_WANTTOGOINTHERE_15_00"); //Jdeme spole�n�.
	AI_Output			(self, other, "DIA_AngarDJG_WANTTOGOINTHERE_04_01"); //Zkus�m to. Ale bu� opatrn�.

	AI_StopProcessInfos (self);  

	if (Npc_IsDead(SkeletonMage_Angar))
	{
		Npc_ExchangeRoutine	(self,"Zwischenstop"); 
	}
	else
	{
		Npc_ExchangeRoutine	(self,"Angriff");
		DJG_AngarAngriff = TRUE; 
	};
		self.aivar[AIV_PARTYMEMBER] = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info UndeadMageDead
///////////////////////////////////////////////////////////////////////
instance DIA_AngarDJG_UndeadMageDead		(C_INFO)
{
	npc		 = 	DJG_705_Angar;
	nr		 = 	13;
	condition	 = 	DIA_AngarDJG_UndeadMageDead_Condition;
	information	 = 	DIA_AngarDJG_UndeadMageDead_Info;
	important	 = 	TRUE;
};

func int DIA_AngarDJG_UndeadMageDead_Condition ()
{
	if 	(
		(Npc_GetDistToWP(self,"OW_UNDEAD_DUNGEON_02")<1000) 
		&& (DJG_AngarAngriff == TRUE)
		&& (DJG_AngarGotAmulett == FALSE)
		&& (Npc_IsDead(SkeletonMage_Angar))
		)
			{
				return TRUE;
			};
};

func void DIA_AngarDJG_UndeadMageDead_Info ()
{
	AI_Output			(self, other, "DIA_AngarDJG_UndeadMageDead_04_00"); //(k�i��) Jenom smrt a zk�za. Mus�m se odsud dostat.
	AI_StopProcessInfos (self);
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine	(self,"RunToEntrance");
};

///////////////////////////////////////////////////////////////////////
//	Info UndeadMageComes
///////////////////////////////////////////////////////////////////////
instance DIA_AngarDJG_UNDEADMAGECOMES		(C_INFO)
{
	npc		 = 	DJG_705_Angar;
	nr		 = 	13;
	condition	 = 	DIA_AngarDJG_UNDEADMAGECOMES_Condition;
	information	 = 	DIA_AngarDJG_UNDEADMAGECOMES_Info;
	important	 = 	TRUE;
};

func int DIA_AngarDJG_UNDEADMAGECOMES_Condition ()
{
		
	if 	(
		(Npc_GetDistToWP(self,"OW_PATH_3_13")<500) 				
		&&	(Npc_KnowsInfo(other, DIA_AngarDJG_WANTTOGOINTHERE))
		&& ((Npc_KnowsInfo(other, DIA_AngarDJG_UndeadMageDead))==FALSE)
		&& (DJG_AngarGotAmulett == FALSE)
		&& (Npc_IsDead(SkeletonMage_Angar))
		)
			{
				return TRUE;
			};
};

func void DIA_AngarDJG_UNDEADMAGECOMES_Info ()
{
	AI_Output			(self, other, "DIA_AngarDJG_UNDEADMAGECOMES_04_00"); //(�ept�) Tady to je! Sly�els to?
	
	AI_StopProcessInfos (self);   
 	
 	Npc_ExchangeRoutine	(self,"GotoStonehendgeEntrance"); 

};

///////////////////////////////////////////////////////////////////////
//	Info Wasistlos
///////////////////////////////////////////////////////////////////////
instance DIA_Angar_WASISTLOS		(C_INFO)
{
	npc		 = 	DJG_705_Angar;
	nr		 = 	14;
	condition	 = 	DIA_Angar_WASISTLOS_Condition;
	information	 = 	DIA_Angar_WASISTLOS_Info;

	description	 = 	"Co se d�je?";
};

func int DIA_Angar_WASISTLOS_Condition ()
{
	if 	(
		(Npc_GetDistToWP(self,"OW_PATH_3_STONES")<1000) 				
		&& (DJG_AngarGotAmulett == FALSE)
		&& (Npc_IsDead(SkeletonMage_Angar))
		)	
			{
					return TRUE;
			};
};

func void DIA_Angar_WASISTLOS_Info ()
{
	AI_Output			(other, self, "DIA_Angar_WASISTLOS_15_00"); //Co se d�je?
	AI_Output			(self, other, "DIA_Angar_WASISTLOS_04_01"); //D�l u� s tebou j�t nem��u.
	AI_Output			(self, other, "DIA_Angar_WASISTLOS_04_02"); //N�co mi ��k�, �e se odsud �iv� nedostanu.
	AI_Output			(self, other, "DIA_Angar_WASISTLOS_04_03"); //Nedok�u to vysv�tlit, ale...
	
	if (SC_KnowsMadPsi == TRUE)
	{
		AI_Output			(self, other, "DIA_Angar_WASISTLOS_04_04"); //M�l bych se z t�hle zpropaden� zem� dostat co nejrychlej�. Jinak m� potk� stejn� osud jako m� bratry.
	}
	else
	{
		AI_Output			(self, other, "DIA_Angar_WASISTLOS_04_05"); //Poka�d�, kdy� naraz�m na tyhle... zplozence pekel, m�m pocit, jako bych bojoval proti vlastn�m lidem.
	};

	AI_StopProcessInfos (self);

	B_LogEntry (TOPIC_Dragonhunter,"Angar prost� ode�el. P�i boji se v�emi t�mi nemrtv�mi m�l pocit, jako by bojoval s vlastn�mi druhy.");
			
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine	(self,"LeavingOW");
};

///////////////////////////////////////////////////////////////////////
//	Info Whyareyouhere
///////////////////////////////////////////////////////////////////////
instance DIA_Angar_WHYAREYOUHERE		(C_INFO)
{
	npc		 = 	DJG_705_Angar;
	nr		 = 15;
	condition	 = 	DIA_Angar_WHYAREYOUHERE_Condition;
	information	 = 	DIA_Angar_WHYAREYOUHERE_Info;

	description	 = 	"Angare! Co tady d�l�?";
};

func int DIA_Angar_WHYAREYOUHERE_Condition ()
{
	if (Npc_GetDistToWP(self,"OW_CAVALORN_01")<1000) 				
		{
			return TRUE;
		};
};

func void DIA_Angar_WHYAREYOUHERE_Info ()
{
	AI_Output			(other, self, "DIA_Angar_WHYAREYOUHERE_15_00"); //Angare! Co tady d�l�?
	AI_Output			(self, other, "DIA_Angar_WHYAREYOUHERE_04_01"); //Byl jsem na cest� k pr�smyku, kdy� jsem narazil na sk�ety. Nedok�zal jsem ty bezbo�n� barbary set��st.
	AI_Output			(self, other, "DIA_Angar_WHYAREYOUHERE_04_02"); //Zat�m tady po�k�m a pak projdu pr�smykem. Uvid�me se na druh� stran�!

	B_LogEntry (TOPIC_Dragonhunter,"Op�t jsem se potkal s Angarem. Je�t� po��d z�st�v� v Hornick�m �dol�.");
	B_GivePlayerXP (XP_AngarDJGAgain); 
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info PermKap4
///////////////////////////////////////////////////////////////////////
instance DIA_Angar_PERMKAP4		(C_INFO)
{
	npc		 = 	DJG_705_Angar;
	condition	 = 	DIA_Angar_PERMKAP4_Condition;
	information	 = 	DIA_Angar_PERMKAP4_Info;
	permanent	 = 	TRUE;

	description	 = 	"Nechci t� tu nechat samotn�ho!";
};

func int DIA_Angar_PERMKAP4_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Angar_WHYAREYOUHERE))
		{
				return TRUE;
		};
};

func void DIA_Angar_PERMKAP4_Info ()
{
	AI_Output			(other, self, "DIA_Angar_PERMKAP4_15_00"); //V�n� t� m��u nechat samotn�ho?
	AI_Output			(self, other, "DIA_Angar_PERMKAP4_04_01"); //Jasn�. Jdi. Uvid�me se.

	AI_StopProcessInfos (self);	
};



// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Angar_PICKPOCKET (C_INFO)
{
	npc			= DJG_705_Angar;
	nr			= 900;
	condition	= DIA_Angar_PICKPOCKET_Condition;
	information	= DIA_Angar_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Angar_PICKPOCKET_Condition()
{
	C_Beklauen (47, 55);
};
 
FUNC VOID DIA_Angar_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Angar_PICKPOCKET);
	Info_AddChoice		(DIA_Angar_PICKPOCKET, DIALOG_BACK 		,DIA_Angar_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Angar_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Angar_PICKPOCKET_DoIt);
};

func void DIA_Angar_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Angar_PICKPOCKET);
};
	
func void DIA_Angar_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Angar_PICKPOCKET);
};


















































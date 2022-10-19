///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Rethon_EXIT   (C_INFO)
{
	npc         = DJG_709_Rethon;
	nr          = 999;
	condition   = DIA_Rethon_EXIT_Condition;
	information = DIA_Rethon_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Rethon_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Rethon_EXIT_Info()
{
	AI_StopProcessInfos (self);
};


///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Rethon_HALLO		(C_INFO)
{
	npc		 = 	DJG_709_Rethon;
	nr		 = 	5;
	condition	 = 	DIA_Rethon_HALLO_Condition;
	information	 = 	DIA_Rethon_HALLO_Info;

	description	 = 	"Co tady d�l�?";
};

func int DIA_Rethon_HALLO_Condition ()
{
	return TRUE;
};

func void DIA_Rethon_HALLO_Info ()
{
	AI_Output			(other, self, "DIA_Rethon_HALLO_15_00"); //Co tady d�l�?
	AI_Output			(self, other, "DIA_Rethon_HALLO_12_01"); //P�ipravuju se na boj. Je�t� n�co?
};


 ///////////////////////////////////////////////////////////////////////
//	Info Kampf
///////////////////////////////////////////////////////////////////////
instance DIA_Rethon_KAMPF		(C_INFO)
{
	npc		 = 	DJG_709_Rethon;
	nr		 = 	6;
	condition	 = 	DIA_Rethon_KAMPF_Condition;
	information	 = 	DIA_Rethon_KAMPF_Info;

	description	 = 	"Proti komu se chyst� bojovat?";
};

func int DIA_Rethon_KAMPF_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Rethon_HALLO))
		{
				return TRUE;
		};
};

func void DIA_Rethon_KAMPF_Info ()
{
	AI_Output			(other, self, "DIA_Rethon_KAMPF_15_00"); //Proti komu se chyst� bojovat?
	AI_Output			(self, other, "DIA_Rethon_KAMPF_12_01"); //��kal jsem si, �e vl�tnu na paladiny a nakopu jim ty jejich tlust� zadky.
	AI_Output			(self, other, "DIA_Rethon_KAMPF_12_02"); //Idiote. Proti drak�m, samoz�ejm�. Cos myslel?
};

///////////////////////////////////////////////////////////////////////
//	Info paladine
///////////////////////////////////////////////////////////////////////
instance DIA_Rethon_PALADINE		(C_INFO)
{
	npc		 = 	DJG_709_Rethon;
	nr		 = 	6;
	condition	 = 	DIA_Rethon_PALADINE_Condition;
	information	 = 	DIA_Rethon_PALADINE_Info;

	description	 = 	"Nevad� paladin�m, �e jsi tady?";
};

func int DIA_Rethon_PALADINE_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Rethon_HALLO))
		{
				return TRUE;
		};
};

func void DIA_Rethon_PALADINE_Info ()
{
	AI_Output			(other, self, "DIA_Rethon_PALADINE_15_00"); //Copak o tob� paladinov� nev�d�?
	AI_Output			(self, other, "DIA_Rethon_PALADINE_12_01"); //Nesmysl. Ty maj� �pln� jin� probl�my. V�t�ina z nich je r�da, �e �ije.
	AI_Output			(self, other, "DIA_Rethon_PALADINE_12_02"); //Mor�lka t�ch chlap� nen� nic moc. To bude jejich konec.
	AI_Output			(self, other, "DIA_Rethon_PALADINE_12_03"); //Jen se pod�vej, jak si sna�� d�t dohromady ty nal�man� me�e, se kter�ma se cht�j� vydat do boje.
	AI_Output			(self, other, "DIA_Rethon_PALADINE_12_04"); //Ka�dej rozumnej v�le�n�k by okam�it� dezertoval.

};


///////////////////////////////////////////////////////////////////////
//	Info WoGruppe
///////////////////////////////////////////////////////////////////////
instance DIA_Rethon_WOGRUPPE		(C_INFO)
{
	npc		 = 	DJG_709_Rethon;
	nr		 = 	7;
	condition	 = 	DIA_Rethon_WOGRUPPE_Condition;
	information	 = 	DIA_Rethon_WOGRUPPE_Info;

	description	 = 	"Opustil jsi svou jednotku?";
};

func int DIA_Rethon_WOGRUPPE_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Rethon_HALLO))
		{
				return TRUE;
		};
};

func void DIA_Rethon_WOGRUPPE_Info ()
{
	AI_Output			(other, self, "DIA_Rethon_WOGRUPPE_15_00"); //Opustil jsi svou jednotku?
	AI_Output			(self, other, "DIA_Rethon_WOGRUPPE_12_01"); //Svoj� jednotku? Nem�l jsem ��dnou jednotku. Jsem sb�ratel trofej�.
	AI_Output			(self, other, "DIA_Rethon_WOGRUPPE_12_02"); //Na rozd�l od ostatn�ch si nem��u dovolit p�ij�t domu s pr�zdnejma rukama. Tak�e nem��u pot�ebovat nikoho dal��ho.
};


///////////////////////////////////////////////////////////////////////
//	Info drachengesehen
///////////////////////////////////////////////////////////////////////
instance DIA_Rethon_DRACHENGESEHEN		(C_INFO)
{
	npc		 = 	DJG_709_Rethon;
	nr		 = 	8;
	condition	 = 	DIA_Rethon_DRACHENGESEHEN_Condition;
	information	 = 	DIA_Rethon_DRACHENGESEHEN_Info;

	description	 = 	"U� jsi vid�l n�jak�ho draka?";
};

func int DIA_Rethon_DRACHENGESEHEN_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Rethon_KAMPF))
		{
				return TRUE;
		};
};

func void DIA_Rethon_DRACHENGESEHEN_Info ()
{
	AI_Output			(other, self, "DIA_Rethon_DRACHENGESEHEN_15_00"); //U� jsi vid�l n�jak�ho draka?
	AI_Output			(self, other, "DIA_Rethon_DRACHENGESEHEN_12_01"); //Ne. Chci si nejd��v naost�it zbra�, ne� na n�j vyraz�m.
};

///////////////////////////////////////////////////////////////////////
//	Info Angst
///////////////////////////////////////////////////////////////////////
instance DIA_Rethon_ANGST		(C_INFO)
{
	npc		 = 	DJG_709_Rethon;
	nr		 = 	9;
	condition	 = 	DIA_Rethon_ANGST_Condition;
	information	 = 	DIA_Rethon_ANGST_Info;

	description	 = 	"Neboj� se, �e t� kv�li tomu n�kdo napadne?";
};

func int DIA_Rethon_ANGST_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Rethon_WOGRUPPE))
		{
				return TRUE;
		};
};

func void DIA_Rethon_ANGST_Info ()
{
	AI_Output			(other, self, "DIA_Rethon_ANGST_15_00"); //Neboj� se, �e t� kv�li tomu n�kdo napadne?

	AI_Output			(self, other, "DIA_Rethon_ANGST_12_01"); //Co? Kdo? Sylvio?

	if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
			AI_Output			(self, other, "DIA_Rethon_ANGST_12_02"); //Tv�j ��f si asi mysl�, �e se tady m��e jen tak zab�jet, co?
			AI_Output			(other, self, "DIA_Rethon_ANGST_15_03"); //Nepat��m k Sylviov�m lidem. Pracuju jen s�m pro sebe.
			AI_Output			(self, other, "DIA_Rethon_ANGST_12_04"); //No, tak dobr�. Zapome�, �e jsem n�co �ekl.
		};

	AI_Output			(self, other, "DIA_Rethon_ANGST_12_05"); //Vid�l jsi ty hastro�e, co m�l s sebou?
	AI_Output			(self, other, "DIA_Rethon_ANGST_12_06"); //Sylvio bude r�d, kdy� se odsud dostane vcelku.

	if (Npc_IsDead(DJG_Sylvio))
	{
	AI_Output			(other, self, "DIA_Rethon_ANGST_15_07"); //Ne, to asi nebude. Je mrtv�.
	AI_Output			(self, other, "DIA_Rethon_ANGST_12_08"); //Taky dob�e.
	}
	else
	{
	Info_AddChoice	(DIA_Rethon_ANGST, DIALOG_BACK, DIA_Rethon_ANGST_weiter );
	Info_AddChoice	(DIA_Rethon_ANGST, "Nevypad�, �e bys ho m�l zrovna v l�sce.", DIA_Rethon_ANGST_sylviomoegen );
	Info_AddChoice	(DIA_Rethon_ANGST, "Tak kde je Sylvio te�?", DIA_Rethon_ANGST_woSylvio );
	Info_AddChoice	(DIA_Rethon_ANGST, "Sylvio byl tady?", DIA_Rethon_ANGST_sylviohier );
	};
};

func void DIA_Rethon_ANGST_weiter ()
{
	Info_ClearChoices	(DIA_Rethon_ANGST);
};

func void DIA_Rethon_ANGST_sylviohier ()
{
	AI_Output			(other, self, "DIA_Rethon_ANGST_sylviohier_15_00"); //Sylvio byl tady?
	AI_Output			(self, other, "DIA_Rethon_ANGST_sylviohier_12_01"); //Mysl� tady na hrad�? Jo, to byl. Ale jenom chvilku.
	AI_Output			(self, other, "DIA_Rethon_ANGST_sylviohier_12_02"); //Promluvil si tu s n�kolika lidmi a pak znovu ode�el.

};

func void DIA_Rethon_ANGST_sylviomoegen ()
{
	AI_Output			(other, self, "DIA_Rethon_ANGST_sylviomoegen_15_00"); //Nevypad�, �e bys ho m�l zrovna v l�sce.
	AI_Output			(self, other, "DIA_Rethon_ANGST_sylviomoegen_12_01"); //Co�e, m�l bych ho m�t r�d? Nejsem py�n� ani na to, �e ho zn�m.
	AI_Output			(self, other, "DIA_Rethon_ANGST_sylviomoegen_12_02"); //Sylvio nem� ��dn� p��tele. Pot�ebuje lidi, co za n�m p�jdou, a je mu �pln� jedno, co za lidi to bude.
	AI_Output			(self, other, "DIA_Rethon_ANGST_sylviomoegen_12_03"); //To nen� nic pro m�. Pracuju s�m.


};

func void DIA_Rethon_ANGST_woSylvio ()
{
	AI_Output			(other, self, "DIA_Rethon_ANGST_woSylvio_15_00"); //Tak kde je Sylvio te�?
	AI_Output			(self, other, "DIA_Rethon_ANGST_woSylvio_12_01"); //Ti paladinov� tady ��kali n�co o ledov�m drakovi na z�pad�. �dajn� je to ten nejmocn�j�� a nejnebezpe�n�j�� drak ze v�ech drak�.
	AI_Output			(self, other, "DIA_Rethon_ANGST_woSylvio_12_02"); //M�ls vid�t, jak Sylviovi zaz��ily o�i, kdy� o tom usly�el. Nen� tak t�k� uhodnout, kam �el.

	B_LogEntry (TOPIC_DRACHENJAGD,"Drakobijce Rethon mumlal cosi o ledov�m drakovi."); 
	B_LogEntry (TOPIC_Dragonhunter,"Sylvio byl zalezl� na hrad� a pak se vydal hledat ledov�ho draka.");

};



///////////////////////////////////////////////////////////////////////
//	Info meineWaffe
///////////////////////////////////////////////////////////////////////
instance DIA_Rethon_MEINEWAFFE		(C_INFO)
{
	npc		 = 	DJG_709_Rethon;
	nr		 = 	10;
	condition	 = 	DIA_Rethon_MEINEWAFFE_Condition;
	information	 = 	DIA_Rethon_MEINEWAFFE_Info;

	description	 = 	"M��e� mi pomoct s vylep�en�m m� zbran�?";
};

func int DIA_Rethon_MEINEWAFFE_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Rethon_PALADINE))
		{
				return TRUE;
		};
};

func void DIA_Rethon_MEINEWAFFE_Info ()
{
	AI_Output			(other, self, "DIA_Rethon_MEINEWAFFE_15_00"); //M��e� mi pomoct s vylep�en�m m� zbran�?
	AI_Output			(self, other, "DIA_Rethon_MEINEWAFFE_12_01"); //Vylep�it? Nejl�p ud�l�, kdy� si koup� n�co nov�ho a ten sv�j starej kr�m zahod�.
	AI_Output			(self, other, "DIA_Rethon_MEINEWAFFE_12_02"); //Mo�n� bych pro tebe n�co m�l. M� z�jem?
};

///////////////////////////////////////////////////////////////////////
//	Info Trade
///////////////////////////////////////////////////////////////////////
instance DIA_Rethon_TRADE		(C_INFO)
{
	npc		 = 	DJG_709_Rethon;
	nr		 = 	11;
	condition	 = 	DIA_Rethon_TRADE_Condition;
	information	 = 	DIA_Rethon_TRADE_Info;
	permanent	 = 	TRUE;
	trade		 = 	TRUE;
	
	description	 = 	"Co mi m��e� nab�dnout?";
};

func int DIA_Rethon_TRADE_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Rethon_MEINEWAFFE))
		{
				return TRUE;
		};
};

func void DIA_Rethon_TRADE_Info ()
{
	AI_Output			(other, self, "DIA_Rethon_TRADE_15_00"); //Co mi m��e� nab�dnout?
	B_GiveTradeInv (self);

	if (hero.guild == GIL_PAL)
		{
			AI_Output			(self, other, "DIA_Rethon_TRADE_12_01"); //Chlape, pod�vej, jak m�m vyprodanej sklad. Te� neprod�v�m zbran� nikomu jin�mu ne� paladin�m.
		}
	else if (hero.guild == GIL_KDF)
		{
			AI_Output			(self, other, "DIA_Rethon_TRADE_12_02"); //Pro m�gy toho v�n� moc nem�m, ale i tak se m��e� pod�vat.
		}
	else
		{
			AI_Output			(self, other, "DIA_Rethon_TRADE_12_03"); //M�m dojem, �e m�m to, co pot�ebuje�, p��teli.
		};
};


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Rethon_PICKPOCKET (C_INFO)
{
	npc			= DJG_709_Rethon;
	nr			= 900;
	condition	= DIA_Rethon_PICKPOCKET_Condition;
	information	= DIA_Rethon_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80;
};                       

FUNC INT DIA_Rethon_PICKPOCKET_Condition()
{
	C_Beklauen (78, 230);
};
 
FUNC VOID DIA_Rethon_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Rethon_PICKPOCKET);
	Info_AddChoice		(DIA_Rethon_PICKPOCKET, DIALOG_BACK 		,DIA_Rethon_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Rethon_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Rethon_PICKPOCKET_DoIt);
};

func void DIA_Rethon_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Rethon_PICKPOCKET);
};
	
func void DIA_Rethon_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Rethon_PICKPOCKET);
};



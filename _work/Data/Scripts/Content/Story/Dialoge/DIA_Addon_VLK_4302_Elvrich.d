///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Addon_Elvrich_EXIT   (C_INFO)
{
	npc         = VLK_4302_Addon_Elvrich;
	nr          = 999;
	condition   = DIA_Addon_Elvrich_EXIT_Condition;
	information = DIA_Addon_Elvrich_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Elvrich_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_Elvrich_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Addon_Elvrich_PICKPOCKET (C_INFO)
{
	npc			= VLK_4302_Addon_Elvrich;
	nr			= 900;
	condition	= DIA_Addon_Elvrich_PICKPOCKET_Condition;
	information	= DIA_Addon_Elvrich_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Addon_Elvrich_PICKPOCKET_Condition()
{
	C_Beklauen (62, 110);
};
 
FUNC VOID DIA_Addon_Elvrich_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Elvrich_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Elvrich_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Elvrich_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Elvrich_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Elvrich_PICKPOCKET_DoIt);
};

func void DIA_Addon_Elvrich_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Elvrich_PICKPOCKET);
};
	
func void DIA_Addon_Elvrich_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Elvrich_PICKPOCKET);
};
///////////////////////////////////////////////////////////////////////
//	Info BanditsThere
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Elvrich_BanditsThere		(C_INFO)
{
	npc		 = 	VLK_4302_Addon_Elvrich;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Elvrich_BanditsThere_Condition;
	information	 = 	DIA_Addon_Elvrich_BanditsThere_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;

};
var int DIA_Addon_Elvrich_BanditsThere_NoPerm;
func int DIA_Addon_Elvrich_BanditsThere_Condition ()
{
	if (Npc_IsInState (self,ZS_Talk))
	&& (DIA_Addon_Elvrich_BanditsThere_NoPerm == FALSE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Elvrich_BanditsThere_Info ()
{
	if (Npc_IsDead(BDT_10307_Addon_RangerBandit_M))
	&& (Npc_IsDead(BDT_10308_Addon_RangerBandit_L))	
	&& (Npc_IsDead(BDT_10309_Addon_RangerBandit_L))	
	&& (Npc_IsDead(BDT_10310_Addon_RangerBandit_M))	
	{
		AI_Output	(self, other, "DIA_Addon_Elvrich_BanditsThere_04_00"); //D�ky boh�m, banditi jsou pry�. Zachr�nils mi krk.
		DIA_Addon_Elvrich_BanditsThere_NoPerm = TRUE;
		self.aivar[AIV_NoFightParker] = FALSE;
	}
	else
	{
		B_Say (self, other, "$NOTNOW");
		AI_StopProcessInfos (self);
	};
};

///////////////////////////////////////////////////////////////////////
//	Info Wer
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Elvrich_Wer		(C_INFO)
{
	npc		 = 	VLK_4302_Addon_Elvrich;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Elvrich_Wer_Condition;
	information	 = 	DIA_Addon_Elvrich_Wer_Info;

	description	 = 	"Kdo jsi?";
};

func int DIA_Addon_Elvrich_Wer_Condition ()
{
	return TRUE;
};

func void DIA_Addon_Elvrich_Wer_Info ()
{
	AI_Output (other, self, "DIA_Addon_Elvrich_Wer_15_00"); //Kdo jsi?
	AI_Output (self, other, "DIA_Addon_Elvrich_Wer_04_01"); //Jmenuju se Elvrich. Jdu z m�sta.
	if (MIS_Thorben_BringElvrichBack == LOG_RUNNING)
	{
		AI_Output (other, self, "DIA_Addon_Elvrich_Wer_15_02"); //Mistr Thorben mi ��kal, �e jsi zmizel.
	};
	AI_Output (self, other, "DIA_Addon_Elvrich_Wer_04_03"); //Tyhle zatracen� �mejdi m� sem dovlekli a dr�eli m� v zajet�.
};

///////////////////////////////////////////////////////////////////////
//	Info MissingPeople
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Elvrich_MissingPeople		(C_INFO)
{
	npc		 = 	VLK_4302_Addon_Elvrich;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Elvrich_MissingPeople_Condition;
	information	 = 	DIA_Addon_Elvrich_MissingPeople_Info;

	description	 = 	"Ve m�st� se poh�e�uje spousta lid�.";
};

func int DIA_Addon_Elvrich_MissingPeople_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Elvrich_Wer))
	&& (SC_HearedAboutMissingPeople == TRUE)
	&& (SCKnowsMissingPeopleAreInAddonWorld == FALSE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Elvrich_MissingPeople_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Elvrich_MissingPeople_15_00"); //Ve m�st� se poh�e�uje spousta lid�.
	AI_Output	(self, other, "DIA_Addon_Elvrich_MissingPeople_04_01"); //O ��dnejch poh�e�ovanejch nic nev�m. M��u ti akor�t ��ct, co se stalo MN�.
};

///////////////////////////////////////////////////////////////////////
//	Info WhatExactly
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Elvrich_WhatExactly		(C_INFO)
{
	npc		 = 	VLK_4302_Addon_Elvrich;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Elvrich_WhatExactly_Condition;
	information	 = 	DIA_Addon_Elvrich_WhatExactly_Info;

	description	 = 	"Co p�esn� se ti stalo?";
};

func int DIA_Addon_Elvrich_WhatExactly_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Elvrich_Wer))
		{
			return TRUE;
		};
};

func void DIA_Addon_Elvrich_WhatExactly_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Elvrich_WhatExactly_15_00"); //A co se ti p�esn� stalo?
	AI_Output	(self, other, "DIA_Addon_Elvrich_WhatExactly_04_01"); //Zrovna jsem m�l sch�zku se svou d�vkou.
	AI_Output	(self, other, "DIA_Addon_Elvrich_WhatExactly_04_02"); //Jmenuje se Lucia. Cht�li jsme spolu ut�ct do hor, daleko od m�sta a od t�ch, co tam �ijou.
	AI_Output	(self, other, "DIA_Addon_Elvrich_WhatExactly_04_03"); //Akor�t jsem dorazil na m�sto srazu, kdy� se z k�ov� najednou vyno�ili tihle banditi a oba n�s zajali.
	AI_Output	(self, other, "DIA_Addon_Elvrich_WhatExactly_04_04"); //Samoz�ejm� �e jsem bojoval, ale nebylo to k ni�emu. Bylo jich moc. Nevid�ls je n�hodou?

	Info_ClearChoices	(DIA_Addon_Elvrich_WhatExactly);
	Info_AddChoice	(DIA_Addon_Elvrich_WhatExactly, "Co po tob� ty banditi cht�li?", DIA_Addon_Elvrich_WhatExactly_Want );
	Info_AddChoice	(DIA_Addon_Elvrich_WhatExactly, "Vypr�v�j mi o Lucii.", DIA_Addon_Elvrich_WhatExactly_lucia );
};
func void DIA_Addon_Elvrich_WhatExactly_Want ()
{
	AI_Output			(other, self, "DIA_Addon_Elvrich_WhatExactly_Want_15_00"); //Co s tebou ti banditi zam��leli?
	AI_Output			(self, other, "DIA_Addon_Elvrich_WhatExactly_Want_04_01"); //Ob�as jsem je v noci sly�el, jak se bav�. Nic jsem sice z jejich hovoru nepochytil, ale mysl�m, �e z n�s cht�li ud�lat otroky.

	Info_AddChoice	(DIA_Addon_Elvrich_WhatExactly, "Kam t� cht�li odvl�ct?", DIA_Addon_Elvrich_WhatExactly_Pirates );
};
func void DIA_Addon_Elvrich_WhatExactly_Pirates ()
{
	AI_Output			(other, self, "DIA_Addon_Elvrich_WhatExactly_Pirates_15_00"); //Kam t� to vlekli?
	AI_Output			(self, other, "DIA_Addon_Elvrich_WhatExactly_Pirates_04_01"); //N�kam sem na ostrov� Khorinidu, ale mysl�m, �e bez lodi se tam ned� dostat.
	AI_Output			(self, other, "DIA_Addon_Elvrich_WhatExactly_Pirates_04_02"); //Odt�hli m� k n�jak�mu kotvi�ti na pob�e��, kde t�bo�ili n�jac� pir�ti.
	AI_Output			(self, other, "DIA_Addon_Elvrich_WhatExactly_Pirates_04_03"); //Jeden z bandit� k nim �el vyjedn�vat. Docela fest se h�dali.
	AI_Output			(self, other, "DIA_Addon_Elvrich_WhatExactly_Pirates_04_04"); //Mysl�m, �e cht�l, aby n�s pir�ti n�kam odvezli.
	AI_Output			(self, other, "DIA_Addon_Elvrich_WhatExactly_Pirates_04_05"); //Ale pir�ti necht�li. Tak se banditi st�hli a od t� doby jsme tr�eli tady.
	AI_Output			(self, other, "DIA_Addon_Elvrich_WhatExactly_Pirates_04_06"); //�ek bych, �e to prohr�li. A pak jsi p�i�el ty.
	
	Elvrich_SCKnowsPirats = TRUE;
	
	Log_CreateTopic (TOPIC_Addon_WhoStolePeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_WhoStolePeople,"Elvricha, u�edn�ka khorinidsk�ho tesa�e Thorbena, unesli bandit�, kte�� se nejsp� spol�ili s pir�ty."); 
	
	Info_AddChoice	(DIA_Addon_Elvrich_WhatExactly, "Pir�ti? Tady v Khorinidu?", DIA_Addon_Elvrich_WhatExactly_Here );
	Info_AddChoice	(DIA_Addon_Elvrich_WhatExactly, "Kde ti  pir�ti kotv�?", DIA_Addon_Elvrich_WhatExactly_pirat );
};
func void DIA_Addon_Elvrich_WhatExactly_Here ()
{
	AI_Output			(other, self, "DIA_Addon_Elvrich_WhatExactly_Here_15_00"); //V Khorinidu a pir�ti?
	AI_Output			(self, other, "DIA_Addon_Elvrich_WhatExactly_Here_04_01"); //Moc toho o nich nev�m. Poprv� jsem je vid�l na tom kotvi�ti.
	AI_Output			(self, other, "DIA_Addon_Elvrich_WhatExactly_Here_04_02"); //V�dycky se dr�ej vzadu a jsou to sam� v Khorinidu hledan� zlo�inci.
	AI_Output			(self, other, "DIA_Addon_Elvrich_WhatExactly_Here_04_03"); //Bojej se �ibenice, a proto se taky nest�kaj s nik�m z m�sta.
};
func void DIA_Addon_Elvrich_WhatExactly_lucia ()
{
	AI_Output			(other, self, "DIA_Addon_Elvrich_WhatExactly_lucia_15_00"); //Vypr�v�j mi o Lucii.
	AI_Output			(self, other, "DIA_Addon_Elvrich_WhatExactly_lucia_04_01"); //Je to holka z p��stavn� �tvrti. Pracovala pro toho d�sn�ho Bromora. Je v�n� p�kn�.
};
func void DIA_Addon_Elvrich_WhatExactly_pirat ()
{
	AI_Output			(other, self, "DIA_Addon_Elvrich_WhatExactly_pirat_15_00"); //Kde maj� pir�ti to kotvi�t�?
	AI_Output			(self, other, "DIA_Addon_Elvrich_WhatExactly_pirat_04_01"); //Nedaleko khorinidsk�ho p��stavu.
	AI_Output			(self, other, "DIA_Addon_Elvrich_WhatExactly_pirat_04_02"); //Kdy� se postav� na pob�e�� a bude� koukat na mo�e, je to doprava pod�l pob�e��. Ale pot�ebuje� lo�.
	AI_Output			(self, other, "DIA_Addon_Elvrich_WhatExactly_pirat_04_03"); //Prvn� mal� z�toka, na kterou naraz�, je to kotvi�t�, o kter�m jsem mluvil.

	Log_CreateTopic (TOPIC_Addon_WhoStolePeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_WhoStolePeople,"Zjistil jsem, jak se dostat k pir�tsk�mu kotvi�ti. Kdy� se postav�m k molu v khorinidsk�m p��stavu �elem k mo�i, mus�m plavat doprava pod�l pob�e��."); 

	Info_AddChoice	(DIA_Addon_Elvrich_WhatExactly, DIALOG_BACK, DIA_Addon_Elvrich_WhatExactly_Back );
};
func void DIA_Addon_Elvrich_WhatExactly_Back ()
{
	Info_ClearChoices	(DIA_Addon_Elvrich_WhatExactly);
};

///////////////////////////////////////////////////////////////////////
//	Info Bromor
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Elvrich_Bromor		(C_INFO)
{
	npc		 = 	VLK_4302_Addon_Elvrich;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Elvrich_Bromor_Condition;
	information	 = 	DIA_Addon_Elvrich_Bromor_Info;

	description	 = 	"Bromor tvrd�, �e Lucia ode�la i se zlatou m�sou.";
};

func int DIA_Addon_Elvrich_Bromor_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Elvrich_WhatExactly))
	&& (MIS_Bromor_LuciaStoleGold == LOG_RUNNING)
		{
			return TRUE;
		};
};

func void DIA_Addon_Elvrich_Bromor_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Elvrich_Bromor_15_00"); //Bromor ��k�, �e Lucia ode�la se zlatou m�sou.
	AI_Output	(self, other, "DIA_Addon_Elvrich_Bromor_04_01"); //No, Lucia ji opravdu Bromorovi ukradla, ale banditi j� ji ur�it� sebrali.

	Log_CreateTopic (TOPIC_Addon_BromorsGold, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_BromorsGold, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_BromorsGold,"Bromor�v zlat� poh�r nejsp� te� maj� bandit� ze severn�ch les� za Sekobov�m statkem."); 
};

///////////////////////////////////////////////////////////////////////
//	Info WhereIsLucia
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Elvrich_WhereIsLucia		(C_INFO)
{
	npc		 = 	VLK_4302_Addon_Elvrich;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Elvrich_WhereIsLucia_Condition;
	information	 = 	DIA_Addon_Elvrich_WhereIsLucia_Info;

	description	 = 	"Kde je Lucie te�?";
};

func int DIA_Addon_Elvrich_WhereIsLucia_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Elvrich_WhatExactly))
	&& (MIS_LuciasLetter != LOG_SUCCESS)
		{
			return TRUE;
		};
};

func void DIA_Addon_Elvrich_WhereIsLucia_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Elvrich_WhereIsLucia_15_00"); //Kde je Lucia te�?
	AI_Output	(self, other, "DIA_Addon_Elvrich_WhereIsLucia_04_01"); //Rozd�lili jsme na velk� k�i�ovatce p�ed Onarov�m statkem.
	AI_Output	(self, other, "DIA_Addon_Elvrich_WhereIsLucia_04_02"); //Banditi Lucii odt�hli do lesa za Sekobov�m statkem.
	AI_Output	(self, other, "DIA_Addon_Elvrich_WhereIsLucia_04_03"); //K� ji Innos ochra�uje.

	Log_CreateTopic (TOPIC_Addon_Lucia, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Lucia, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_Lucia,"Bandit� Lucii unesli a� do les� za Sekobov�m statkem kdesi na severu."); 

	SC_KnowsLuciaCaughtByBandits = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info FernandosWaffen
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Elvrich_FernandosWaffen		(C_INFO)
{
	npc		 = 	VLK_4302_Addon_Elvrich;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Elvrich_FernandosWaffen_Condition;
	information	 = 	DIA_Addon_Elvrich_FernandosWaffen_Info;

	description	 = 	"Dostali ti bandit�, kte�� t� v�znili, z�silku zbran�?";
};

func int DIA_Addon_Elvrich_FernandosWaffen_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Elvrich_WhatExactly))
	&& (MIS_Vatras_FindTheBanditTrader == LOG_RUNNING)	
		{
			return TRUE;
		};
};

func void DIA_Addon_Elvrich_FernandosWaffen_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Elvrich_FernandosWaffen_15_00"); //Nenesli ti banditi, co t� tu dr�eli, n�jakou z�sobu zbran�?
	AI_Output	(self, other, "DIA_Addon_Elvrich_FernandosWaffen_04_01"); //Jojo, bylo jich tolik, �e je sotva unesli.
	AI_Output	(self, other, "DIA_Addon_Elvrich_FernandosWaffen_04_02"); //T�hli jich celou hromadu a zmizeli sm�rem k Sekobov� statku.
	B_GivePlayerXP (XP_Ambient);

	Log_CreateTopic (TOPIC_Addon_BanditTrader, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_BanditTrader, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_BanditTrader,"Cesta m� zavedla na sever, do les� za Sekobov�m statkem. N�kde tu pr� s�dl� bandit�, kte�� obdr�eli spoustu zbran�."); 
};

///////////////////////////////////////////////////////////////////////
//	Info LuciaLetter
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Elvrich_LuciaLetter		(C_INFO)
{
	npc		 = 	VLK_4302_Addon_Elvrich;
	nr		 = 	4;
	condition	 = 	DIA_Addon_Elvrich_LuciaLetter_Condition;
	information	 = 	DIA_Addon_Elvrich_LuciaLetter_Info;

	description	 = 	"Na�el jsem dopis od tv� Lucie.";
};

func int DIA_Addon_Elvrich_LuciaLetter_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Elvrich_WhatExactly))
	&& (Npc_HasItems (other,ItWr_LuciasLoveLetter_Addon))
		{
			return TRUE;
		};
};

func void DIA_Addon_Elvrich_LuciaLetter_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Elvrich_LuciaLetter_15_00"); //Na�el jsem dopis od Lucie.
	AI_Output	(self, other, "DIA_Addon_Elvrich_LuciaLetter_04_01"); //(nad�en�) Co�e? Dej ho sem!
	B_UseFakeScroll ();
	AI_Output	(self, other, "DIA_Addon_Elvrich_LuciaLetter_04_02"); //(zoufale) NE! Tomu nev���m! Ne, tomu prost� nem��u uv��it.
	AI_Output	(self, other, "DIA_Addon_Elvrich_LuciaLetter_04_03"); //(zoufale) P�ece m� takhle neopust�!
	AI_Output	(self, other, "DIA_Addon_Elvrich_LuciaLetter_04_04"); //(zoufale) Vem si ten dopis, nechci ho. Pevn� v���m, �e se ke mn� jednou p�ece jenom vr�t�.
	
	Log_CreateTopic (TOPIC_Addon_Lucia, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Lucia, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_Lucia,"Elvrich nechce v��it, �e Lucie ode�la s bandity dobrovoln�. St�le douf�, �e se vr�t�, a to i p�esto, �e mu poslala dopis na rozlou�enou."); 

	B_GivePlayerXP (XP_Addon_LuciasLetter);
	MIS_LuciasLetter = LOG_SUCCESS;
};

///////////////////////////////////////////////////////////////////////
//	Info WasNun
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Elvrich_WasNun		(C_INFO)
{
	npc		 = 	VLK_4302_Addon_Elvrich;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Elvrich_WasNun_Condition;
	information	 = 	DIA_Addon_Elvrich_WasNun_Info;
	permanent	 = 	FALSE;

	description	 = 	"M�l by ses rychle vr�tit do m�sta!";
};

func int DIA_Addon_Elvrich_WasNun_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Elvrich_WhereIsLucia))
	{
		return TRUE;
	};
};

func void DIA_Addon_Elvrich_WasNun_Info ()
{
	AI_Output (other, self, "DIA_Addon_Elvrich_WasNun_15_00"); //M�l by ses rychle vr�tit do m�sta.
	AI_Output (self, other, "DIA_Addon_Elvrich_WasNun_04_01"); //Co jin�ho m��u d�lat? Vr�t�m se rovnou k mistru Thorbenovi.
	AI_Output (self, other, "DIA_Addon_Elvrich_WasNun_04_02"); //Pod�v� se po t�ch banditech?
	AI_Output (other, self, "DIA_Addon_Elvrich_WasNun_15_03"); //No ano, mysl�m, �e jo.
	AI_Output (self, other, "DIA_Addon_Elvrich_WasNun_04_04"); //Kdybys na�el Lucii, p�ivede� ji do m�sta, �e jo?
	AI_Output (other, self, "DIA_Addon_Elvrich_WasNun_15_05"); //Uvid�m, co se d� d�lat.

	Log_CreateTopic (TOPIC_Addon_MissingPeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_MissingPeople, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_MissingPeople,"Elvrich se vr�til zp�tky ke sv�mu mistrovi, tesa�i Thorbenovi."); 

	Elvrich_GoesBack2Thorben = TRUE;
	Npc_ExchangeRoutine	(self,"BACKINTHECITY");
	EquipItem	(self, ItMw_1h_Bau_Mace);
};

///////////////////////////////////////////////////////////////////////
// PERM
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Elvrich_PERM		(C_INFO)
{
	npc		 	= VLK_4302_Addon_Elvrich;
	nr		 	= 5;
	condition	= DIA_Addon_Elvrich_PERM_Condition;
	information	= DIA_Addon_Elvrich_PERM_Info;
	permanent	= TRUE;
	important 	= TRUE;
};
func int DIA_Addon_Elvrich_PERM_Condition ()
{
	if (Elvrich_GoesBack2Thorben == TRUE)
	&& (Npc_IsInState(self, ZS_Talk))
	&& (MIS_LuciasLetter != LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Addon_Elvrich_PERM_Info ()
{
	AI_Output (self, other, "DIA_Addon_Elvrich_PERM_04_00"); //D�ky za z�chranu!
};



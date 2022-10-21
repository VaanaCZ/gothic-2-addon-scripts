///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Fenia_EXIT   (C_INFO)
{
	npc         = VLK_476_Fenia;
	nr          = 999;
	condition   = DIA_Fenia_EXIT_Condition;
	information = DIA_Fenia_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Fenia_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Fenia_EXIT_Info()
{
	if (hero.guild == GIL_PAL)
	{
		AI_Output			(self, other, "DIA_Fenia_EXIT_17_00"); //P�knej den, pane paladin.
	};

	if (hero.guild == GIL_KDF)
	{
		AI_Output			(self, other, "DIA_Fenia_EXIT_17_01"); //P�eju bezpe�nou cestu, ctihodn� m�gu.
	};
	
	AI_StopProcessInfos (self);
};
 // ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Fenia_PICKPOCKET (C_INFO)
{
	npc			= VLK_476_Fenia;
	nr			= 900;
	condition	= DIA_Fenia_PICKPOCKET_Condition;
	information	= DIA_Fenia_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60_Female;
};                       

FUNC INT DIA_Fenia_PICKPOCKET_Condition()
{
	C_Beklauen (50, 75);
};
 
FUNC VOID DIA_Fenia_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Fenia_PICKPOCKET);
	Info_AddChoice		(DIA_Fenia_PICKPOCKET, DIALOG_BACK 		,DIA_Fenia_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Fenia_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Fenia_PICKPOCKET_DoIt);
};

func void DIA_Fenia_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Fenia_PICKPOCKET);
};
	
func void DIA_Fenia_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Fenia_PICKPOCKET);
};
///////////////////////////////////////////////////////////////////////
//	Info Hallo 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Fenia_Hallo   (C_INFO)
{
	npc         = VLK_476_Fenia;
	nr          = 3;
	condition   = DIA_Fenia_Hallo_Condition;
	information = DIA_Fenia_Hallo_Info;
	important	 = 	TRUE;
};

FUNC INT DIA_Fenia_Hallo_Condition()
{
	if (Npc_IsInState (self,ZS_Talk))
		{
			return TRUE;
		};	
};

FUNC VOID DIA_Fenia_Hallo_Info()
{
		if (hero.guild == GIL_NONE)
		{
			AI_Output			(self, other, "DIA_Fenia_Hallo_17_00"); //Vypad� n�jak utrm�cen�. Dlouho jsi nespal, co?
			AI_Output			(other, self, "DIA_Fenia_Hallo_15_01"); //Moc dlouho, dalo by se ��ct.
		};
	AI_Output			(self, other, "DIA_Fenia_Hallo_17_02"); //Poj� sem, bl�. Se mnou najde� to, co hled�!
	
	Log_CreateTopic (Topic_CityTrader,LOG_NOTE);
	B_LogEntry (Topic_CityTrader,"Fenia prod�v� p�i cest� do p��stavu j�dlo.");
};


///////////////////////////////////////////////////////////////////////
//	Info Handeln
///////////////////////////////////////////////////////////////////////
instance DIA_Fenia_HANDELN		(C_INFO)
{
	npc			 = 	VLK_476_Fenia;
	nr			 = 	10;
	condition	 = 	DIA_Fenia_HANDELN_Condition;
	information	 = 	DIA_Fenia_HANDELN_Info;
	permanent	 = 	TRUE;
	trade		 = 	TRUE;
	description	 = 	"Uka� mi sv� zbo��.";
};

func int DIA_Fenia_HANDELN_Condition ()
{	
	if Npc_KnowsInfo (hero,DIA_Fenia_HALLO)
	{
		return TRUE;
	};
};
func void DIA_Fenia_HANDELN_Info ()
{
	B_GiveTradeInv (self);
	AI_Output			(other, self, "DIA_Fenia_HANDELN_15_00"); //Uka� mi sv� zbo��.
};

///////////////////////////////////////////////////////////////////////
//	Info Infos
///////////////////////////////////////////////////////////////////////
instance DIA_Fenia_Infos		(C_INFO)
{
	npc			 = 	VLK_476_Fenia;
	nr			 = 	10;
	condition	 = 	DIA_Fenia_Infos_Condition;
	information	 = 	DIA_Fenia_Infos_Info;
	permanent 	 =  FALSE;
	description	 = 	"��kala jsi, �e m�, co pot�ebuju. T�k� se to i informac�?";
};

func int DIA_Fenia_Infos_Condition ()
{	
	if Npc_KnowsInfo (hero,DIA_Fenia_HALLO)
	{
		return TRUE;
	};
};
func void DIA_Fenia_Infos_Info ()
{
	AI_Output			(other, self, "DIA_Fenia_Infos_15_00"); //��kala jsi, �e m�, co pot�ebuju. T�k� se to i informac�?
	AI_Output			(self, other, "DIA_Fenia_Infos_17_01"); //Ale samoz�ejm�. Co bys cht�l v�d�t?
};

///////////////////////////////////////////////////////////////////////
//	MoreTraders
///////////////////////////////////////////////////////////////////////
instance DIA_Fenia_MoreTraders (C_INFO)
{
	npc			= VLK_476_Fenia;
	nr			= 11;
	condition	= DIA_Fenia_MoreTraders_Condition;
	information	= DIA_Fenia_MoreTraders_Info;
	permanent 	= FALSE;
	description	= "Jsou tady v p��stavu je�t� n�jac� dal�� kupci?";
};

func int DIA_Fenia_MoreTraders_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Fenia_Infos))
	{
		return TRUE;
	};
};
func void DIA_Fenia_MoreTraders_Info ()
{
	AI_Output			(other, self, "DIA_Fenia_Infos_haendler_15_00"); //Jsou tady v p��stavu je�t� n�jac� dal�� kupci?
	AI_Output			(self, other, "DIA_Fenia_Infos_haendler_17_01"); //Kdy� se pust� po molu nalevo, naraz� na Halvora, m�ho mu�e. Prod�v� ryby.
	AI_Output			(self, other, "DIA_Fenia_Infos_haendler_17_02"); //Na opa�n�m konci je Brahim, kartograf.
};

///////////////////////////////////////////////////////////////////////
//	OV
///////////////////////////////////////////////////////////////////////
instance DIA_Fenia_OV (C_INFO)
{
	npc			= VLK_476_Fenia;
	nr			= 13;
	condition	= DIA_Fenia_OV_Condition;
	information	= DIA_Fenia_OV_Info;
	permanent 	= FALSE;
	description	= "Zn� n�koho z horn� �tvrti?";
};

func int DIA_Fenia_OV_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Fenia_Infos))
	&& (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};
func void DIA_Fenia_OV_Info ()
{
	AI_Output			(other, self, "DIA_Fenia_Infos_oberesViertel_15_00"); //Zn� n�koho z horn� �tvrti?
	AI_Output			(self, other, "DIA_Fenia_Infos_oberesViertel_17_01"); //(sm�ch) Kdybych znala n�koho z horn� �tvrti, tak bych tady nebyla, hochu.
};

///////////////////////////////////////////////////////////////////////
//	Hafen
///////////////////////////////////////////////////////////////////////
instance DIA_Fenia_Interesting (C_INFO)
{
	npc			= VLK_476_Fenia;
	nr			= 14;
	condition	= DIA_Fenia_Interesting_Condition;
	information	= DIA_Fenia_Interesting_Info;
	permanent 	= FALSE;
	description	= "Na co zaj�mav�ho m��u tady v p��stavu narazit?";
};

func int DIA_Fenia_Interesting_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Fenia_Infos))
	{
		return TRUE;
	};
};
func void DIA_Fenia_Interesting_Info ()
{
	AI_Output (other, self, "DIA_Fenia_Infos_interessantes_15_00"); //Co je tady v p��stavu zaj�mav�ho k vid�n�?
	AI_Output (self, other, "DIA_Fenia_Infos_interessantes_17_01"); //No, jestli hled� n�jakou z�bavu, zajdi do Kardifovy kr�my na molu. Ka�dou chv�li se tam n�co semele.
	AI_Output (self, other, "DIA_Fenia_Infos_interessantes_17_02"); //To m��e� jen t�ko minout. Ten chl�pek, co stoj� u vchodu, ur�it� upout� tvoji pozornost.
	AI_Output (self, other, "DIA_Fenia_Infos_interessantes_17_03"); //Krom� toho je tady je�t� ta velk� lo� paladin�. Kr�lova majest�tn� v�le�n� galeona. To je to jedin�, co tady stoj� za zhl�dnut�.
	AI_Output (self, other, "DIA_Fenia_Infos_interessantes_17_04"); //Najde� ji, kdy� se od toho chl�pka d� doleva a pak kolem skalnat�ho sr�zu.
};

///////////////////////////////////////////////////////////////////////
//	Hafen
///////////////////////////////////////////////////////////////////////
instance DIA_Fenia_Aufregend (C_INFO)
{
	npc			= VLK_476_Fenia;
	nr			= 15;
	condition	= DIA_Fenia_Aufregend_Condition;
	information	= DIA_Fenia_Aufregend_Info;
	permanent 	= FALSE;
	description	= "Stalo se posledn� dobou n�co zaj�mav�ho?";
};

func int DIA_Fenia_Aufregend_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Fenia_Infos))
	{
		return TRUE;
	};
};
func void DIA_Fenia_Aufregend_Info ()
{
	AI_Output (other, self, "DIA_Fenia_Add_15_00"); //Stalo se v posledn� dob� n�co zaj�mav�ho?
	AI_Output (self, other, "DIA_Fenia_Add_17_01"); //Dalo by se to tak ��ct. N�co takov�ho u� tu dlouho nebylo.
	AI_Output (self, other, "DIA_Fenia_Add_17_02"); //B�el tudy n�jak� zlod�j. Musel v doln� ��sti m�sta ukr�st luk.
	AI_Output (self, other, "DIA_Fenia_Add_17_03"); //Samoz�ejm� �e domobrana p�i�la moc pozd�. Jako v�dycky.
	AI_Output (self, other, "DIA_Fenia_Add_17_04"); //Utekl jim - sta�ilo mu jen sesko�it do p��stavu a byl pry�.
};







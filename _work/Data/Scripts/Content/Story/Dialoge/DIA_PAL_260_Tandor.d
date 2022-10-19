///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Tandor_EXIT   (C_INFO)
{
	npc         = PAL_260_Tandor;
	nr          = 999;
	condition   = DIA_Tandor_EXIT_Condition;
	information = DIA_Tandor_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Tandor_EXIT_Condition()
{
	if (Kapitel < 3)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Tandor_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Tandor_Hallo		(C_INFO)
{
	npc			 = 	PAL_260_Tandor;
	nr			 = 	2;
	condition	 = 	DIA_Tandor_Hallo_Condition;
	information	 = 	DIA_Tandor_Hallo_Info;
	permanent 	 =  FALSE;
	important 	 =  TRUE;
};
func int DIA_Tandor_Hallo_Condition ()
{	
	if Npc_IsInState (self, ZS_Talk)
	{
			return TRUE;
	};
};
func void DIA_Tandor_Hallo_Info ()
{
	AI_Output (self, other, "DIA_Tandor_Hallo_08_00"); //Pro�el jsi p�es pr�smyk? Dobr� pr�ce. U� jsme tam ztratili v�c ne� dost dobr�ch mu��.
	AI_Output (self, other, "DIA_Tandor_Hallo_08_01"); //S�m dob�e v�m, jak to tam vypad� - jeden �as jsem byl u pr�zkumn� jednotky.
	AI_Output (self, other, "DIA_Tandor_Hallo_08_02"); //M� zbra�? Jestli pot�ebuje� dobrou zbra�, tak jsi tady spr�vn�.
	
	Log_CreateTopic (TOPIC_Trader_OC,LOG_NOTE);
	B_LogEntry (TOPIC_Trader_OC,"Tandor na hrad� obchoduje se zbran�mi.");
};
///////////////////////////////////////////////////////////////////////
//	Info Sp�htrupp
///////////////////////////////////////////////////////////////////////
instance DIA_Tandor_Trupp		(C_INFO)
{
	npc			 = 	PAL_260_Tandor;
	nr			 = 	2;
	condition	 = 	DIA_Tandor_Trupp_Condition;
	information	 = 	DIA_Tandor_Trupp_Info;
	permanent 	 =  FALSE;
	description  =  "Co se s tou jednotkou stalo?";
};
func int DIA_Tandor_Trupp_Condition ()
{	
	if Npc_KnowsInfo (other,DIA_Tandor_Hallo)
	{
			return TRUE;
	};
};
func void DIA_Tandor_Trupp_Info ()
{
	AI_Output (other, self, "DIA_Tandor_Trupp_15_00"); //Co se s tou jednotkou stalo?
	AI_Output (self, other, "DIA_Tandor_Trupp_08_01"); //Prozkoum�vali jsme oblast a cht�li se dostat na pob�e��. Ut�bo�ili jsme se v jeskyni.
	AI_Output (self, other, "DIA_Tandor_Trupp_08_02"); //Pozd� v noci p�i�li sk�eti. �turmovali po svahu s pochodn�mi a bubny - a na�li n�s.
	AI_Output (self, other, "DIA_Tandor_Trupp_08_03"); //Pokusili jsme se uprchnout, ale byl jsem jedin�, komu se poda�ilo odtamtud vyv�znout.
	AI_Output (self, other, "DIA_Tandor_Trupp_08_04"); //Kr�tce na to postavili sk�eti svou palis�du, tak jsme se st�hli do hradu.
};	
///////////////////////////////////////////////////////////////////////
//	Info Trade
///////////////////////////////////////////////////////////////////////
instance DIA_Tandor_Trade		(C_INFO)
{
	npc			 = 	PAL_260_Tandor;
	nr			 = 	900;
	condition	 = 	DIA_Tandor_Trade_Condition;
	information	 = 	DIA_Tandor_Trade_Info;
	permanent 	 =  TRUE;
	trade		 =	TRUE;
	description	 = 	"Uka� mi sv� zbo��.";
};
func int DIA_Tandor_Trade_Condition ()
{
		return TRUE;
};
func void DIA_Tandor_Trade_Info ()
{
	B_GiveTradeInv (self);
	AI_Output (other, self, "DIA_Tandor_Trade_15_00"); //Uka� mi sv� zbo��.
};		
///////////////////////////////////////////////////////////////////////
//	Info DIA_Tandor_Equipment
///////////////////////////////////////////////////////////////////////
instance DIA_Tandor_Equipment		(C_INFO)
{
	npc		 	 = 	PAL_260_Tandor;
	nr		 	 =  3;
	condition	 = 	DIA_Tandor_Equipment_Condition;
	information	 = 	DIA_Tandor_Equipment_Info;
	description	 = 	"Pos�l� m� Garond - pot�ebuju vybavit.";
};

func int DIA_Tandor_Equipment_Condition ()
{
	if  Npc_KnowsInfo (hero, DIA_Garond_Equipment)
	&& (other.guild == GIL_MIL)
	&& (Kapitel == 2)
	{
		return TRUE;
	};
};
func void DIA_Tandor_Equipment_Info ()
{
	AI_Output (other, self, "DIA_Tandor_Equipment_15_00"); //Pos�l� m� Garond - pot�ebuju se vybavit.
	AI_Output (self, other, "DIA_Tandor_Equipment_08_01"); //Zbra� na bl�zko, nebo na d�lku?
	
	Info_ClearChoices (DIA_Tandor_Equipment);
	Info_AddChoice 	  (DIA_Tandor_Equipment,"Na bl�zko.",DIA_Tandor_Equipment_Nah);
	Info_AddChoice 	  (DIA_Tandor_Equipment,"Na d�lku.",DIA_Tandor_Equipment_Fern);
};
FUNC VOID DIA_Tandor_Equipment_Nah()
{
	AI_Output (other, self, "DIA_Tandor_Equipment_Nah_15_00"); //Na bl�zko.
	AI_Output (self, other, "DIA_Tandor_Equipment_Nah_08_01"); //Bojuje� jednou rukou, nebo ob�ma?
	
	Info_ClearChoices (DIA_Tandor_Equipment);
	Info_AddChoice 	  (DIA_Tandor_Equipment,"Jednou rukou.",DIA_Tandor_Equipment_Ein);
	Info_AddChoice 	  (DIA_Tandor_Equipment,"Ob�ma rukama.",DIA_Tandor_Equipment_Zwei);
};
FUNC VOID DIA_Tandor_Equipment_Fern()
{
	AI_Output (other, self, "DIA_Tandor_Equipment_Fern_15_00"); //Na d�lku.
	AI_Output (self, other, "DIA_Tandor_Equipment_Fern_08_01"); //Luk, nebo ku�i?
	
	Info_ClearChoices (DIA_Tandor_Equipment);
	Info_AddChoice 	  (DIA_Tandor_Equipment,"Luk",DIA_Tandor_Equipment_Bow);
	Info_AddChoice 	  (DIA_Tandor_Equipment,"Ku�e",DIA_Tandor_Equipment_Crossbow);
};	
FUNC VOID DIA_Tandor_Equipment_Ein()
{
	AI_Output (other, self, "DIA_Tandor_Equipment_Ein_15_00"); //Jednou rukou.
	AI_Output (self, other, "DIA_Tandor_Equipment_Ein_08_01"); //Tak si vezmi tohle. Je to dobr� zbra�.
	B_GiveInvItems (self,other, ItMw_Steinbrecher,1);
	Info_ClearChoices (DIA_Tandor_Equipment);
};
FUNC VOID DIA_Tandor_Equipment_Zwei()
{
	AI_Output (other, self, "DIA_Tandor_Equipment_Zwei_15_00"); //Ob�ma rukama.
	AI_Output (self, other, "DIA_Tandor_Equipment_Zwei_08_01"); //S t�mhle obouru��kem bys m�l b�t spokojen�.
	B_GiveInvItems (self,other,ItMw_Zweihaender1 ,1);
	Info_ClearChoices (DIA_Tandor_Equipment);
};
FUNC VOID DIA_Tandor_Equipment_Bow()
{
	AI_Output (other, self, "DIA_Tandor_Equipment_Bow_15_00"); //Luk.
	AI_Output (self, other, "DIA_Tandor_Equipment_Bow_08_01"); //Tenhle loveck� luk je pro tebe jako d�lan�. D�m ti tak� n�jak� ��py.
	B_GiveInvItems (self,other,ItRw_Bow_L_03 ,1);
	B_GiveInvItems (self,other, ItRw_Arrow,50);
	Info_ClearChoices (DIA_Tandor_Equipment);
};
FUNC VOID DIA_Tandor_Equipment_Crossbow()
{
	AI_Output (other, self, "DIA_Tandor_Equipment_Crossbow_15_00"); //Ku�e.
	AI_Output (self, other, "DIA_Tandor_Equipment_Crossbow_08_01"); //V tom p��pad� si vezmi tuhle lehkou ku�i. M��u ti d�t tak� n�jak� �ipky.
	B_GiveInvItems (self,other, ItRw_Crossbow_L_02,1);
	B_GiveInvItems (self,other, ItRw_Bolt,50);
	Info_ClearChoices (DIA_Tandor_Equipment);
};
//#####################################################################
//##
//##
//##							KAPITEL 3
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP3
// ************************************************************

INSTANCE DIA_Tandor_KAP3_EXIT(C_INFO)
{
	npc			= PAL_260_Tandor;
	nr			= 999;
	condition	= DIA_Tandor_KAP3_EXIT_Condition;
	information	= DIA_Tandor_KAP3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Tandor_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Tandor_KAP3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};


//#####################################################################
//##
//##
//##							KAPITEL 4
//##
//##
//#####################################################################


// ************************************************************
// 	  				   EXIT KAP4
// ************************************************************

INSTANCE DIA_Tandor_KAP4_EXIT(C_INFO)
{
	npc			= PAL_260_Tandor;
	nr			= 999;
	condition	= DIA_Tandor_KAP4_EXIT_Condition;
	information	= DIA_Tandor_KAP4_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Tandor_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Tandor_KAP4_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info News
///////////////////////////////////////////////////////////////////////
instance DIA_Tandor_News		(C_INFO)
{
	npc			 = 	PAL_260_Tandor;
	nr			 = 	40;
	condition	 = 	DIA_Tandor_News_Condition;
	information	 = 	DIA_Tandor_News_Info;
	permanent	 = 	TRUE;
	description	 = 	"N�co nov�ho?";
};

func int DIA_Tandor_News_Condition ()
{
	if (Kapitel	== 4)
	&& (Npc_KnowsInfo (hero,DIA_Tandor_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Tandor_News_Info ()
{
	AI_Output (other, self, "DIA_Tandor_News_15_00"); //N�co nov�ho?

	if (hero.guild == GIL_DJG)
		{
			AI_Output (self, other, "DIA_Tandor_News_08_01"); //V posledn� dob� se stala jedin� v�c - p�i�li drakobijci.
		}
	else
		{
			AI_Output (self, other, "DIA_Tandor_News_08_02"); //P�ijeli drakobijci.
			AI_Output (self, other, "DIA_Tandor_News_08_03"); //Vypadaj� jako p�kn� tvrd� parchanti - a to douf�m jsou, proto�e jinak moc dlouho nevydr��.
		};
};
//#####################################################################
//##
//##
//##							KAPITEL 5
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP5
// ************************************************************

INSTANCE DIA_Tandor_KAP5_EXIT(C_INFO)
{
	npc			= PAL_260_Tandor;
	nr			= 999;
	condition	= DIA_Tandor_KAP5_EXIT_Condition;
	information	= DIA_Tandor_KAP5_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Tandor_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Tandor_KAP5_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info wasistlos
///////////////////////////////////////////////////////////////////////
instance DIA_Tandor_WASISTLOS		(C_INFO)
{
	npc		 = 	PAL_260_Tandor;
	nr		 = 	51;
	condition	 = 	DIA_Tandor_WASISTLOS_Condition;
	information	 = 	DIA_Tandor_WASISTLOS_Info;
	permanent	 = 	TRUE;

	description	 = 	"Netv��� se zrovna ��astn�.";
};

func int DIA_Tandor_WASISTLOS_Condition ()
{
	if (Kapitel == 5)	
		&& (Npc_KnowsInfo (hero,DIA_Tandor_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Tandor_WASISTLOS_Info ()
{
	AI_Output			(other, self, "DIA_Tandor_WASISTLOS_15_00"); //Netv��� se zrovna ��astn�.

	if (MIS_OCGateOpen == TRUE)
	{
	AI_Output			(self, other, "DIA_Tandor_WASISTLOS_08_01"); //Sk�et� bude st�le v�c a v�c. Dokud nebude po n�s.
	}
	else
	{
	AI_Output			(self, other, "DIA_Tandor_WASISTLOS_08_02"); //U� t�den jsem po��dn� nejedl. M�m hlad jako vlk.
	};
};


//#####################################################################
//##
//##
//##							KAPITEL 6
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP6
// ************************************************************


INSTANCE DIA_Tandor_KAP6_EXIT(C_INFO)
{
	npc			= PAL_260_Tandor;
	nr			= 999;
	condition	= DIA_Tandor_KAP6_EXIT_Condition;
	information	= DIA_Tandor_KAP6_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Tandor_KAP6_EXIT_Condition()
{
	if (Kapitel == 6)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Tandor_KAP6_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};




// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Tandor_PICKPOCKET (C_INFO)
{
	npc			= PAL_260_Tandor;
	nr			= 900;
	condition	= DIA_Tandor_PICKPOCKET_Condition;
	information	= DIA_Tandor_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Tandor_PICKPOCKET_Condition()
{
	C_Beklauen (47, 90);
};
 
FUNC VOID DIA_Tandor_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Tandor_PICKPOCKET);
	Info_AddChoice		(DIA_Tandor_PICKPOCKET, DIALOG_BACK 		,DIA_Tandor_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Tandor_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Tandor_PICKPOCKET_DoIt);
};

func void DIA_Tandor_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Tandor_PICKPOCKET);
};
	
func void DIA_Tandor_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Tandor_PICKPOCKET);
};








































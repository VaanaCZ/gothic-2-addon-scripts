// ***********************************************************
// 						 	EXIT
// ***********************************************************
INSTANCE DIA_Meldor_EXIT   (C_INFO)
{
	npc         = VLK_415_Meldor;
	nr          = 999;
	condition   = DIA_Meldor_EXIT_Condition;
	information = DIA_Meldor_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Meldor_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Meldor_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

// ***********************************************************
// 						 	Hallo
// ***********************************************************
instance DIA_Meldor_Hallo		(C_INFO)
{
	npc		 	= VLK_415_Meldor;
	nr 			= 2;
	condition	= DIA_Meldor_Hallo_Condition;
	information	= DIA_Meldor_Hallo_Info;
	permanent 	= FALSE;
	important	= TRUE;
};

func int DIA_Meldor_Hallo_Condition ()
{
	if (Npc_IsInState (self, ZS_Talk))
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Meldor_Hallo_Info ()
{
	AI_Output (self, other, "DIA_Meldor_Hallo_07_00"); //Co chce�?
	AI_Output (other, self, "DIA_Meldor_Hallo_15_01"); //Cht�l jsem se tu trochu porozhl�dnout.
	AI_Output (self, other, "DIA_Meldor_Hallo_07_02"); //A kam p�esn� m� nam��eno?
};

// ***********************************************************
// 						 	Interessantes
// ***********************************************************
instance DIA_Meldor_Interessantes		(C_INFO)
{
	npc		 	= VLK_415_Meldor;
	nr 			= 2;
	condition	= DIA_Meldor_Interessantes_Condition;
	information	= DIA_Meldor_Interessantes_Info;
	permanent 	= FALSE;
	description	= "Co je tu zaj�mav�ho k vid�n�?";
};

func int DIA_Meldor_Interessantes_Condition ()
{
	return TRUE;
};

func void DIA_Meldor_Interessantes_Info ()
{
	AI_Output (other, self, "DIA_Meldor_Interessantes_15_00"); //Co je tu zaj�mav�ho k vid�n�?
	AI_Output (self, other, "DIA_Meldor_Interessantes_07_01"); //Najde� tu nev�stinec i hospodu. Hostinsk� se jmenuje Kardif a jestli hled� n�jak� informace, pak je on ten prav�, s k�m si m� promluvit.
	AI_Output (self, other, "DIA_Meldor_Interessantes_07_02"); //Mimochodem, nepot�ebuje� pen�ze?
	
	Log_CreateTopic (Topic_CityTrader,LOG_NOTE);
	B_LogEntry (Topic_CityTrader,"Kardif, hospodsk� z p��stavn� kr�my, prod�v� krom ko�alky i informace.");
};

// ***********************************************************
// 						 	Lehmar
// ***********************************************************
instance DIA_Meldor_Lehmar		(C_INFO)
{
	npc		 	= VLK_415_Meldor;
	nr 			= 3;
	condition	= DIA_Meldor_Lehmar_Condition;
	information	= DIA_Meldor_Lehmar_Info;
	permanent 	= FALSE;
	description	= "Ty se jich chce� zbavit?";
};

func int DIA_Meldor_Lehmar_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Meldor_Interessantes))
	{
		return TRUE;
	};
};

func void DIA_Meldor_Lehmar_Info ()
{
	AI_Output (other, self, "DIA_Meldor_Lehmar_15_00"); //Ty se jich chce� zbavit?
	AI_Output (self, other, "DIA_Meldor_Lehmar_07_01"); //(znud�n�) Ne, ale p��mo naproti p�es ulici s�dl� Lehmar - lichv��.
	AI_Output (self, other, "DIA_Meldor_Lehmar_07_02"); //Ur�it� ti p�r zla��k� p�j��, jen b� d�l.
	Npc_ExchangeRoutine (self, "START");
};


// ***********************************************************
// 						 	Arbeitest
// ***********************************************************
instance DIA_Meldor_Arbeitest		(C_INFO)
{
	npc		 	= VLK_415_Meldor;
	nr 			= 4;
	condition	= DIA_Meldor_Arbeitest_Condition;
	information	= DIA_Meldor_Arbeitest_Info;
	permanent 	= FALSE;
	description	= "Ty pro Lehmara pracuje�?";
};

func int DIA_Meldor_Arbeitest_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Meldor_Lehmar))
	{
		return TRUE;
	};
};

func void DIA_Meldor_Arbeitest_Info ()
{
	AI_Output (other, self, "DIA_Meldor_Arbeitest_15_00"); //Ty pro Lehmara pracuje�?
	AI_Output (self, other, "DIA_Meldor_Arbeitest_07_01"); //Bystrej hoch.
};

// ***********************************************************
// 						 	InsOV
// ***********************************************************
instance DIA_Meldor_InsOV		(C_INFO)
{
	npc		 	= VLK_415_Meldor;
	nr 			= 5;
	condition	= DIA_Meldor_InsOV_Condition;
	information	= DIA_Meldor_InsOV_Info;
	permanent 	= FALSE;
	description	= "Vlastn� jsem m�l nam��eno do horn� �tvrti...";
};

func int DIA_Meldor_InsOV_Condition ()
{
	return TRUE;
};

func void DIA_Meldor_InsOV_Info ()
{
	AI_Output (other, self, "DIA_Meldor_InsOV_15_00"); //Vlastn� jsem m�l nam��eno do horn� �tvrti.
	AI_Output (self, other, "DIA_Meldor_InsOV_07_01"); //(sarkasticky) No jasn�. A j� si zase cht�l najmout lo�, aby m� zavezla p��mo na kr�lovsk� dv�r k audienci.
	AI_Output (self, other, "DIA_Meldor_InsOV_07_02"); //Od t� doby, co sem p�i�li paladinov�, nemaj� takov� jako ty nebo j� v horn� �tvrti co pohled�vat.
};

// ***********************************************************
// 						 	Citizen
// ***********************************************************
instance DIA_Meldor_Citizen		(C_INFO)
{
	npc		 	= VLK_415_Meldor;
	nr 			= 6;
	condition	= DIA_Meldor_Citizen_Condition;
	information	= DIA_Meldor_Citizen_Info;
	permanent 	= FALSE;
	description	= "Ty jsi ob�anem tohoto m�sta?";
};

func int DIA_Meldor_Citizen_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Meldor_InsOV))
	{
		return TRUE;
	};
};

func void DIA_Meldor_Citizen_Info ()
{
	AI_Output (other, self, "DIA_Meldor_Citizen_15_00"); //Ty jsi ob�anem tohoto m�sta?
	AI_Output (self, other, "DIA_Meldor_Citizen_07_01"); //Pokud t�m mysl�, jestli tu bydl�m, pak ano. Ale stejn� m� do horn� �tvrti nepust�.
	AI_Output (self, other, "DIA_Meldor_Citizen_07_02"); //Tam se mohou dostat jenom nabub�el� hejskov� nebo obchodn�ci a �emesln�ci z doln� ��sti.
	AI_Output (self, other, "DIA_Meldor_Citizen_07_03"); //Lid� z p��stavu v Khorinidu nemaj� velkou moc. Dokonce tu nem�me ani st�lou hl�dku domobrany.

};
// ***********************************************************
// 						 Smoke
// ***********************************************************
instance DIA_Meldor_Smoke		(C_INFO)
{
	npc		 	= VLK_415_Meldor;
	nr 			= 5;
	condition	= DIA_Meldor_Smoke_Condition;
	information	= DIA_Meldor_Smoke_Info;
	permanent 	= FALSE;
	description	= "Nev�, kde bych sehnal n�jak� ku�ivo?";
};

func int DIA_Meldor_Smoke_Condition ()
{	
	if (MIS_Andre_REDLIGHT == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Meldor_Smoke_Info ()
{
	var C_ITEM heroArmor; heroArmor = Npc_GetEquippedArmor(other);
	
	AI_Output (other, self, "DIA_Meldor_Smoke_15_00"); //Nev�, kde bych sehnal n�jak� ku�ivo?
	
	if (Hlp_IsItem (heroArmor, ItAR_MIl_L) == TRUE) 
	{
		AI_Output (self, other, "DIA_Meldor_Smoke_07_01"); //(odhaduje) Ne, nem�m pon�t�.
	}
	else
	{
		AI_Output (self, other, "DIA_Meldor_Smoke_07_02"); //Hmm, b�t tebou, zkus�m �t�st� u �erven� lucerny.
	};
};

// ***********************************************************
// 						 	PERM
// ***********************************************************
var int Meldor_DGNews;
// --------------------

instance DIA_Meldor_PERM		(C_INFO)
{
	npc		 	= VLK_415_Meldor;
	nr 			= 7;
	condition	= DIA_Meldor_PERM_Condition;
	information	= DIA_Meldor_PERM_Info;
	permanent 	= TRUE;
	description	= "Stalo se tu posledn� dobou n�co zaj�mav�ho?";
};

func int DIA_Meldor_PERM_Condition ()
{
	return TRUE;
};

func void DIA_Meldor_PERM_Info ()
{
	AI_Output (other, self, "DIA_Meldor_PERM_15_00"); //Stalo se v posledn� dob� n�co zaj�mav�ho?
	
	if (Kapitel <= 1)
	{
		AI_Output (self, other, "DIA_Meldor_PERM_07_01"); //P�ed ned�vnem obr�tily str�e celou p��stavn� �tvr� vzh�ru nohama.
		AI_Output (self, other, "DIA_Meldor_PERM_07_02"); //Hledaly n�jakou odcizenou v�c - posledn� dobou se tu kr�de�e dost rozrostly, zvl�t� v lep��ch �tvrt�ch.
		AI_Output (self, other, "DIA_Meldor_PERM_07_03"); //O�ividn� se sna�� ty chud�ky z p��stavu obvinit �pln� ze v�eho.
	}
	else if (Andre_Diebesgilde_aufgeraeumt == TRUE)
	&&		(Meldor_DGNews == FALSE)
	{
		AI_Output (self, other, "DIA_Meldor_PERM_07_04"); //Doneslo se mi, �e dole ve stok�ch byl rozpr�en n�jak� zlod�jsk� klan. V�ichni krad�ci byli zabiti.
		Meldor_DGNews = TRUE;
	}
	else if (Kapitel == 3)
	{
		AI_Output (self, other, "DIA_Meldor_PERM_07_05"); //V Hornick�m �dol� jsou pr� draci. Zaj�malo by m�, jestli odsud te� paladinov� vyraz� a pust� se s nimi do boje.
	}
	else if (Kapitel == 5)
	{
		AI_Output (self, other, "DIA_Meldor_PERM_07_06"); //Podle toho, co se ��k�, tak u� jsou v�ichni draci mrtv�. N�kdo je vymetl �elezn�m ko�t�tem.
	}
	else
	{
		AI_Output (self, other, "DIA_Meldor_PERM_07_07"); //Ne.
	};
};

// ***********************************************************
// 						 	Lehmar
// ***********************************************************

instance DIA_Meldor_VonLehmar		(C_INFO)
{
	npc			 = 	VLK_415_Meldor;
	nr			 =  1;
	condition	 = 	DIA_Meldor_VonLehmar_Condition;
	information	 = 	DIA_Meldor_VonLehmar_Info;
	permanent 	 =  FALSE;
	important	 = 	TRUE;
};
func int DIA_Meldor_VonLehmar_Condition ()
{
	if 	((Lehmar_GeldGeliehen_Day <= (Wld_GetDay()-2))
	&&   (Lehmar_GeldGeliehen != 0))
	&& (RangerHelp_LehmarKohle == FALSE)
	&& (Lehmar.aivar[AIV_DefeatedByPlayer] == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Meldor_VonLehmar_Info ()
{
	AI_Output (self, other, "DIA_Meldor_VonLehmar_07_00"); //Hej, po�kej...
	AI_Output (self, other, "DIA_Meldor_VonLehmar_07_01"); //Nesu ti zpr�vu od Lehmara.

	AI_StopProcessInfos (self);

	B_Attack (self, other, AR_NONE, 1);	
};




// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Meldor_PICKPOCKET (C_INFO)
{
	npc			= VLK_415_Meldor;
	nr			= 900;
	condition	= DIA_Meldor_PICKPOCKET_Condition;
	information	= DIA_Meldor_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Meldor_PICKPOCKET_Condition()
{
	C_Beklauen (34, 55);
};
 
FUNC VOID DIA_Meldor_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Meldor_PICKPOCKET);
	Info_AddChoice		(DIA_Meldor_PICKPOCKET, DIALOG_BACK 		,DIA_Meldor_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Meldor_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Meldor_PICKPOCKET_DoIt);
};

func void DIA_Meldor_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Meldor_PICKPOCKET);
};
	
func void DIA_Meldor_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Meldor_PICKPOCKET);
};

































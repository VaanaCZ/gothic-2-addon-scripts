// ************************************************************
// 								EXIT
// ************************************************************
INSTANCE DIA_Maria_EXIT   (C_INFO)
{
	npc         = BAU_910_Maria;
	nr          = 999;
	condition   = DIA_Maria_EXIT_Condition;
	information = DIA_Maria_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Maria_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Maria_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

// ************************************************************
// 								Hallo
// ************************************************************
instance DIA_Maria_Hallo		(C_INFO)
{
	npc			= BAU_910_Maria;
	nr		 	= 1;
	condition	= DIA_Maria_Hallo_Condition;
	information	= DIA_Maria_Hallo_Info;
	permanent  	= FALSE;
	description = "Kdo jsi?";
};

func int DIA_Maria_Hallo_Condition ()
{
	return TRUE;
};

func void DIA_Maria_Hallo_Info ()
{
	AI_Output (other, self, "DIA_Maria_Hallo_15_00"); //Kdo jsi?
	AI_Output (self, other, "DIA_Maria_Hallo_17_01"); //Jsem Onarova �ena, Maria.
	AI_Output (self, other, "DIA_Maria_Hallo_17_02"); //Co tady chce�?
};

// ************************************************************
// 								Umsehen
// ************************************************************
instance DIA_Maria_Umsehen		(C_INFO)
{
	npc			= BAU_910_Maria;
	nr		 	= 2;
	condition	= DIA_Maria_Umsehen_Condition;
	information	= DIA_Maria_Umsehen_Info;
	permanent  	= FALSE;
	description = "Jen jsem se tu cht�l porozhl�dnout...";
};

func int DIA_Maria_Umsehen_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Maria_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Maria_Umsehen_Info ()
{
	AI_Output (other, self, "DIA_Maria_Umsehen_15_00"); //Jen jsem si to cht�l tady prohl�dnout.
	AI_Output (self, other, "DIA_Maria_Umsehen_17_01"); //S tolika chlapama na farm� se te� nem��u uvnit� domu moc zdr�ovat.
	AI_Output (self, other, "DIA_Maria_Umsehen_17_02"); //Prost� sem jen tak vpadli.
};

// ************************************************************
// 								Umsehen
// ************************************************************
instance DIA_Maria_Soeldner	(C_INFO)
{
	npc			= BAU_910_Maria;
	nr		 	= 3;
	condition	= DIA_Maria_Soeldner_Condition;
	information	= DIA_Maria_Soeldner_Info;
	permanent  	= FALSE;
	description = "Obt�uj� t� ti �old�ci?";
};

func int DIA_Maria_Soeldner_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Maria_Umsehen))
	{
		return TRUE;
	};
};

func void DIA_Maria_Soeldner_Info ()
{
	AI_Output (other, self, "DIA_Maria_Soeldner_15_00"); //Obt�uj� t� ti �old�ci?

	if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
			AI_Output (self, other, "DIA_Maria_Soeldner_17_01"); //Hele, zapome� na to, co jsem pr�v� �ekla - je tu te� mnohem bezpe�n�ji, co se ti chlapi objevili.
		}
	else
		{
			AI_Output (self, other, "DIA_Maria_Soeldner_17_02"); //No, p�inejmen��m je tu te�, co jsou tu �old�ci, mnohem bezpe�n�ji.
		};

	AI_Output (self, other, "DIA_Maria_Soeldner_17_03"); //Dokud jsme tu byli sami, poka�d� p�i�la domobrana z m�sta a sebrala na�i �rodu.
	AI_Output (self, other, "DIA_Maria_Soeldner_17_04"); //Sebrali nejlep�� ��st �rody. A taky si vzali p�r ovc�. Nedali n�m za to v�bec nic.
	AI_Output (self, other, "DIA_Maria_Soeldner_17_05"); //N�kte�� z t�ch ni�em� se tu dokonce odv�ili kr�st.
	if (hero.guild == GIL_MIL)
		{
			AI_Output (self, other, "DIA_Maria_Soeldner_17_06"); //Nevysv�tluj si to nijak zle, voj�ku. V�m, �e takov� nejsou v�ichni.
		};	
};

// ************************************************************
// 							Mission
// ************************************************************
instance DIA_Maria_Mission	(C_INFO)
{
	npc			= BAU_910_Maria;
	nr		 	= 4;
	condition	= DIA_Maria_Mission_Condition;
	information	= DIA_Maria_Mission_Info;
	permanent  	= FALSE;
	description = "Tak co ti ukradli?";
};

func int DIA_Maria_Mission_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Maria_Soeldner))
	&& (MIS_Maria_BringPlate != LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Maria_Mission_Info ()
{
	AI_Output (other, self, "DIA_Maria_Mission_15_00"); //Tak co ti ukradli?
	AI_Output (self, other, "DIA_Maria_Mission_17_01"); //V�t�inou zlato a st��bro. Taky n�m sebrali svatebn� dar. Zlat� t�c.
	if (other.guild != GIL_MIL)
	{
		AI_Output (self, other, "DIA_Maria_Mission_17_02"); //Vsad�m se, �e te� se na n�m usazuje prach v truhle n�jak�ho mizern�ho m�stsk�ho str�n�ho.
	};
	MIS_Maria_BringPlate = LOG_RUNNING;
};

// ************************************************************
// 							BringPlate
// ************************************************************
instance DIA_Maria_BringPlate	(C_INFO)
{
	npc			= BAU_910_Maria;
	nr		 	= 5;
	condition	= DIA_Maria_BringPlate_Condition;
	information	= DIA_Maria_BringPlate_Info;
	permanent  	= FALSE;
	description = "M�m u sebe zlat� t�c. Nen� n�hodou tv�j?";
};

func int DIA_Maria_BringPlate_Condition ()
{
	if (Npc_HasItems (other, ItMi_MariasGoldPlate) > 0)
	{
		return TRUE;
	};
};

func void DIA_Maria_BringPlate_Info ()
{
	B_GiveInvItems (other, self, ItMi_MariasGoldPlate, 1);
	AI_Output (other, self, "DIA_Maria_BringPlate_15_00"); //M�m u sebe zlat� t�c. Nen� n�hodou tv�j?
	AI_Output (self, other, "DIA_Maria_BringPlate_17_01"); //Ano! To je on! Tis�cer� d�ky!
	
	MIS_Maria_BringPlate = LOG_SUCCESS;
	B_GivePlayerXP (XP_Maria_Teller);
};


// ************************************************************
// 							BringPlate
// ************************************************************
var int Maria_Belohnung;
// ---------------------

instance DIA_Maria_Belohnung	(C_INFO)
{
	npc			= BAU_910_Maria;
	nr		 	= 6;
	condition	= DIA_Maria_Belohnung_Condition;
	information	= DIA_Maria_Belohnung_Info;
	permanent  	= TRUE;
	description = "A co takhle n�jakou odm�nu?";
};

func int DIA_Maria_Belohnung_Condition ()
{
	if (MIS_Maria_BringPlate == LOG_SUCCESS)
	&& (Maria_Belohnung == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Maria_Belohnung_Info ()
{
	AI_Output (other, self, "DIA_Maria_Belohnung_15_00"); //A co takhle n�jakou odm�nu?
	
	
	if (other.guild == GIL_SLD)
	|| (Npc_KnowsInfo (other, DIA_Onar_HowMuch))
	{
		AI_Output (self, other, "DIA_Maria_Belohnung_17_01"); //Pracuje� pro m�ho man�ela jako �oldn��, ne?
		AI_Output (other, self, "DIA_Maria_Belohnung_15_02"); //Spr�vn�.
		AI_Output (self, other, "DIA_Maria_Belohnung_17_03"); //Kolik ti plat�?
		B_Say_Gold (other, self, SOLD);
		AI_Output (self, other, "DIA_Maria_Belohnung_17_04"); //To tedy moc nen�. Zajdi za n�m a �ekni mu, a� ti p�id�.
		AI_Output (other, self, "DIA_Maria_Belohnung_15_05"); //A mysl�, �e to ud�l�?
		AI_Output (self, other, "DIA_Maria_Belohnung_17_06"); //V�, co by se stalo, kdyby ne. V�� mi.
		Maria_MehrGold = TRUE;
		Maria_Belohnung = TRUE;
	}
	else if (other.guild == GIL_NONE)
	{
		AI_Output (self, other, "DIA_Maria_Belohnung_17_07"); //Chce� se tady na farm� nechat najmout jako �old�k?
		Info_ClearChoices (DIA_Maria_Belohnung);
		Info_AddChoice (DIA_Maria_Belohnung, "Ne - v�n� ne.", DIA_Maria_Belohnung_Gold);
		Info_AddChoice (DIA_Maria_Belohnung, "Ano.", DIA_Maria_Belohnung_SOLD);
	}
	else
	{
		B_GiveInvItems (self, other, itmi_gold, 50);
		Maria_Belohnung = TRUE;
		AI_Output (self, other, "DIA_Maria_Belohnung_17_08"); //Tady, vezmi si to. Zaslou�� si to.
	};
};

func void DIA_Maria_Belohnung_Gold()
{
	AI_Output (other, self, "DIA_Maria_Belohnung_Gold_15_00"); //Ne - v�n� ne.
	B_GiveInvItems (self, other, itmi_gold, 50);
	Maria_Belohnung = TRUE;
	AI_Output (self, other, "DIA_Maria_Belohnung_Gold_17_01"); //Tak si na opl�tku vezmi tohle zlato. Zaslou�il sis to.
	Info_ClearChoices (DIA_Maria_Belohnung);
};

func void DIA_Maria_Belohnung_SOLD()
{
	AI_Output (other, self, "DIA_Maria_Belohnung_SOLD_15_00"); //Ano.
	AI_Output (self, other, "DIA_Maria_Belohnung_SOLD_17_01"); //Dobr�, pokud tady pracuje�, tak dohl�dnu na to, abys dost�val slu�n� �old.
	AI_Output (self, other, "DIA_Maria_Belohnung_SOLD_17_02"); //Vra� se, a� si s m�m man�elem promluv� o tv�m platu.
	Info_ClearChoices (DIA_Maria_Belohnung);
};
		
// ************************************************************
// 							AboutOnar
// ************************************************************
instance DIA_Maria_AboutOnar	(C_INFO)
{
	npc			= BAU_910_Maria;
	nr		 	= 7;
	condition	= DIA_Maria_AboutOnar_Condition;
	information	= DIA_Maria_AboutOnar_Info;
	permanent  	= FALSE;
	description = "Pov�z mi n�co o Onarovi.";
};

func int DIA_Maria_AboutOnar_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Maria_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Maria_AboutOnar_Info ()
{
	AI_Output (other, self, "DIA_Maria_AboutOnar_15_00"); //�ekni mi n�co o Onarovi.
	AI_Output (self, other, "DIA_Maria_AboutOnar_17_01"); //Je to fajn chlap. Trochu nabru�en� a hodn� netrp�liv�, ale v�ichni m�me sv� chyby.
	AI_Output (self, other, "DIA_Maria_AboutOnar_17_02"); //�ekla jsem sv�mu mu�i, pro� ty voj�ky nech�, aby s n�m takhle zach�zeli.
	AI_Output (self, other, "DIA_Maria_AboutOnar_17_03"); //D�lej n�co, ��k�m.
	AI_Output (self, other, "DIA_Maria_AboutOnar_17_04"); //Tak najal �oldn��e. Te� se c�t�m jako uprost�ed v�lky.
	AI_Output (self, other, "DIA_Maria_AboutOnar_17_05"); //Ale my vlastn� jsme ve v�lce, nebo ne?
};

// ************************************************************
// 							PERM
// ************************************************************
instance DIA_Maria_PERM	(C_INFO)
{
	npc			= BAU_910_Maria;
	nr		 	= 8;
	condition	= DIA_Maria_PERM_Condition;
	information	= DIA_Maria_PERM_Info;
	permanent  	= FALSE;
	description = "Stalo se posledn� dobou n�co zaj�mav�ho?";
};

func int DIA_Maria_PERM_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Maria_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Maria_PERM_Info ()
{
	AI_Output (other, self, "DIA_Maria_PERM_15_00"); //Stalo se posledn� dobou n�co zaj�mav�ho?
	if (Kapitel <= 2)
	{
		AI_Output (self, other, "DIA_Maria_PERM_17_01"); //Pro�li tudy paladinov�.
		AI_Output (self, other, "DIA_Maria_PERM_17_02"); //Nejd��v jsme si mysleli, �e p�i�li napadnout farmu, ale ve skute�nosti m�li nam��eno do Hornick�ho �dol�.
	}
	
	if (Kapitel == 3)
	{
		AI_Output (self, other, "DIA_Maria_PERM_17_03"); //Wasili na�apal p�ed p�r dny v noci zlod�je. Jinak je tady klid.
	};
	
	if (Kapitel >= 4)
	{
		AI_Output (self, other, "DIA_Maria_PERM_17_04"); //Je to tu mnohem klidn�j��, co n�kte�� ze �oldn��� ode�li.
	};
};
			

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Maria_PICKPOCKET (C_INFO)
{
	npc			= BAU_910_Maria;
	nr			= 900;
	condition	= DIA_Maria_PICKPOCKET_Condition;
	information	= DIA_Maria_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60_Female;
};                       

FUNC INT DIA_Maria_PICKPOCKET_Condition()
{
	C_Beklauen (60, 110);
};
 
FUNC VOID DIA_Maria_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Maria_PICKPOCKET);
	Info_AddChoice		(DIA_Maria_PICKPOCKET, DIALOG_BACK 		,DIA_Maria_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Maria_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Maria_PICKPOCKET_DoIt);
};

func void DIA_Maria_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Maria_PICKPOCKET);
};
	
func void DIA_Maria_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Maria_PICKPOCKET);
};


			
			
			
			



	
















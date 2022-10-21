///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Valentino_EXIT   (C_INFO)
{
	npc         = VLK_421_Valentino;
	nr          = 999;
	condition   = DIA_Valentino_EXIT_Condition;
	information = DIA_Valentino_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Valentino_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Valentino_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Valentino_HALLO		(C_INFO)
{
	npc		 	= VLK_421_Valentino;
	nr 			= 1;
	condition	= DIA_Valentino_HALLO_Condition;
	information	= DIA_Valentino_HALLO_Info;
	permanent 	= FALSE;
	description	= "Tak�e copak to tu m�me?";
};

func int DIA_Valentino_HALLO_Condition ()
{
	return TRUE;
};

func void DIA_Valentino_HALLO_Info ()
{
	AI_Output			(other, self, "DIA_Valentino_HALLO_15_00"); //Tak�e copak to tu m�me?
	//AI_Output (other, self, "DIA_Valentino_Add_15_00"); //Hey, wer bist du denn?
	if (hero.guild == GIL_KDF)
	|| (hero.guild == GIL_PAL)
	{
		AI_Output			(self, other, "DIA_Valentino_HALLO_03_01"); //Jmenuji se Valentino. Sna��m se, abych tento den, kter� mi Innos dal, neznesv�til ��dnou prac�.
		AI_Output			(other, self, "DIA_Valentino_HALLO_15_02"); //D�vej pozor na to, co ��k�.
		AI_Output			(self, other, "DIA_Valentino_HALLO_03_03"); //Ach, omluv m�. Necht�l jsem Tvou Milost nijak urazit, �, pros�m za odpu�t�n�, pane.
	}
	else
	{
		AI_Output			(self, other, "DIA_Valentino_HALLO_03_04"); //Copak se neum� chovat? To je nechutn�!
		AI_Output			(self, other, "DIA_Valentino_HALLO_03_05"); //Po��d tahle �pinav� ch�tra! Nem� b�t n�hodou n�kde v pr�ci?
		AI_Output			(self, other, "DIA_Valentino_HALLO_03_06"); //Ale po��t�m, �e takov�ho o�unt�l�ho chl�pka jako ty si ka�d� v�imne, co?
		AI_Output			(self, other, "DIA_Valentino_HALLO_03_07"); //No, a� bude� m�t tolik zlata jako j�, taky nebude� muset v�bec pracovat. Ale ty nikdy takhle bohat� nebude�.
		AI_Output			(other, self, "DIA_Valentino_HALLO_15_08"); //Vid�m, �e s tebou si u�iju po��dnou srandu.
	};
};

// ********************************************************
// 						WhoAgain
// ********************************************************

instance DIA_Valentino_WhoAgain		(C_INFO)
{
	npc		 	= VLK_421_Valentino;
	nr 			= 2;
	condition	= DIA_Valentino_WhoAgain_Condition;
	information	= DIA_Valentino_WhoAgain_Info;
	permanent 	= FALSE;
	description	= "Ptal jsem se t�, kdo jsi!";
};

func int DIA_Valentino_WhoAgain_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Valentino_HALLO))
	&& (other.guild != GIL_KDF)
	&& (other.guild != GIL_PAL)
	{
		return TRUE;
	};
};

func void DIA_Valentino_WhoAgain_Info ()
{
	AI_Output (other, self, "DIA_Valentino_Add_15_01"); //Ptal jsem se t�, kdo jsi!
	//AI_Output			(other, self, "DIA_Valentino_HALLO_wasmachstdu_15_00"); //Was macht jemand wie du in der Stadt?
	AI_Output			(self, other, "DIA_Valentino_HALLO_wasmachstdu_03_01"); //Jsem �vih�k Valentino. Bonviv�n a mil��ek �en!
	AI_Output			(self, other, "DIA_Valentino_HALLO_wasmachstdu_03_02"); //Tr�pen� nezn�m, v�ak moudrost� a zlatem opl�v�m a �eny mi padaj� k noh�m, sotva mne spat��.
	AI_Output			(self, other, "DIA_Valentino_HALLO_wasmachstdu_03_03"); //Jestli m� probl�my, nech si je pro sebe, j� na n� zv�dav� nejsem.
};

// ********************************************************
// 						Manieren
// ********************************************************

instance DIA_Valentino_Manieren		(C_INFO)
{
	npc		 	= VLK_421_Valentino;
	nr 			= 3;
	condition	= DIA_Valentino_Manieren_Condition;
	information	= DIA_Valentino_Manieren_Info;
	permanent 	= FALSE;
	description	= "Zd� se mi, �e bych ti m�l u�t�d�it men�� lekci slu�n�ho chov�n�!";
};

func int DIA_Valentino_Manieren_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Valentino_HALLO))
	&& (other.guild != GIL_PAL)
	&& (other.guild != GIL_KDF)
	{
		return TRUE;
	};
};

func void DIA_Valentino_Manieren_Info ()
{
	AI_Output (other, self, "DIA_Valentino_Add_15_02"); //Zd� se mi, �e bych ti m�l u�t�d�it men�� lekci slu�n�ho chov�n�!
	//AI_Output			(other, self, "DIA_Valentino_HALLO_klappe_15_00"); //F�r deine d�nnen �rmchen hast du 'ne ganz sch�n gro�e Klappe!
	AI_Output			(self, other, "DIA_Valentino_HALLO_klappe_03_01"); //Mn� to nevad�. Jen si m� klidn� zbij. A� se z�tra r�no probud�m, zase mi bude dob�e.
	AI_Output			(self, other, "DIA_Valentino_HALLO_klappe_03_02"); //Ale ty s t�mhle ksichtem bude� muset chodit cel� �ivot.
};

///////////////////////////////////////////////////////////////////////
//	Info Wasnuetzliches
///////////////////////////////////////////////////////////////////////

var int Valentino_Lo_Perm;
var int Valentino_Hi_Perm;
//---------------------------------------------------

instance DIA_Valentino_WASNUETZLICHES		(C_INFO)
{
	npc		 	= VLK_421_Valentino;
	nr 			= 4;
	condition	= DIA_Valentino_WASNUETZLICHES_Condition;
	information	= DIA_Valentino_WASNUETZLICHES_Info;
	permanent	= TRUE;
	description	= "Chce� mi ��ct je�t� n�co jin�ho?";
};

func int DIA_Valentino_WASNUETZLICHES_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Valentino_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Valentino_WASNUETZLICHES_Info ()
{
	AI_Output (other, self, "DIA_Valentino_Add_15_03"); //(klidn�) Chce� mi ��ci je�t� n�co jin�ho?
	//AI_Output			(other, self, "DIA_Valentino_WASNUETZLICHES_15_00"); //Kannst du mir was N�tzliches �ber die Stadt erz�hlen?
	
	if (self.aivar[AIV_DefeatedByPlayer] == TRUE)
	{
		B_Say (self, other, "$NOTNOW");
	}
	else if (Valentino_Lo_Perm == FALSE)
	&& (other.guild != GIL_PAL)
	&& (other.guild != GIL_KDF)
	{
		AI_Output (self, other, "DIA_Valentino_WASNUETZLICHES_03_01"); //Z�skej si v�hlas, nikdy nikomu nic neslibuj, ber si, co chce�, a d�vej si pozor, aby ses nedostal do sporu s domobranou.
		AI_Output (self, other, "DIA_Valentino_WASNUETZLICHES_03_02"); //Nebo se ��rliv�mi man�eli, samoz�ejm� - ti jsou ze v�ech nejhor��, to ti pov�m.
		Valentino_Lo_Perm = TRUE;
	}
	else if (Valentino_Hi_Perm == FALSE)
	&& ( (other.guild == GIL_PAL) || (other.guild == GIL_KDF) )
	{
		AI_Output (self, other, "DIA_Valentino_WASNUETZLICHES_03_03"); //Pro mu�e tv�ho postaven� nen� nic nemo�n�. Prost� jen mus� poznat, kdy je �as k �inu.
		AI_Output (self, other, "DIA_Valentino_WASNUETZLICHES_03_04"); //Tak neztr�cej �as a jednej!
		Valentino_Hi_Perm = TRUE;
	}
	else
	{
		AI_Output (self ,other,"DIA_Valentino_WASNUETZLICHES_03_05"); //U� jsem ti �ekl v�echno, co pot�ebuje� v�d�t - zbytek je na tob�.
	};
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Valentino_PICKPOCKET (C_INFO)
{
	npc			= VLK_421_Valentino;
	nr			= 900;
	condition	= DIA_Valentino_PICKPOCKET_Condition;
	information	= DIA_Valentino_PICKPOCKET_Info;
	permanent	= TRUE;
	description = "(Tento kl�� p�jde ukr�st snadno.)";
};                       

FUNC INT DIA_Valentino_PICKPOCKET_Condition()
{
	if (Npc_GetTalentSkill (other,NPC_TALENT_PICKPOCKET) == 1) 
	&& (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (Npc_HasItems(self, ItKe_Valentino) >= 1)
	&& (other.attribute[ATR_DEXTERITY] >= (30 - Theftdiff))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Valentino_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Valentino_PICKPOCKET);
	Info_AddChoice		(DIA_Valentino_PICKPOCKET, DIALOG_BACK 		,DIA_Valentino_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Valentino_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Valentino_PICKPOCKET_DoIt);
};

func void DIA_Valentino_PICKPOCKET_DoIt()
{
	if (other.attribute[ATR_DEXTERITY] >= 30)
	{
		B_GiveInvItems (self, other, ItKe_Valentino, 1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GivePlayerXP (XP_Ambient);
		Info_ClearChoices (DIA_Valentino_PICKPOCKET);
	}
	else
	{
		AI_StopProcessInfos	(self);
		B_Attack (self, other, AR_Theft, 1); 
	};
};
	
func void DIA_Valentino_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Valentino_PICKPOCKET);
};





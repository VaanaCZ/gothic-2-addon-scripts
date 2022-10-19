///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Peck_EXIT   (C_INFO)
{
	npc         = Mil_324_Peck;
	nr          = 999;
	condition   = DIA_Peck_EXIT_Condition;
	information = DIA_Peck_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Peck_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Peck_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Peck_PICKPOCKET (C_INFO)
{
	npc			= Mil_324_Peck;
	nr			= 900;
	condition	= DIA_Peck_PICKPOCKET_Condition;
	information	= DIA_Peck_PICKPOCKET_Info;
	permanent	= TRUE;
	description = "(Kr�de� tohoto kl��e by byla riskantn�)";
};                       

FUNC INT DIA_Peck_PICKPOCKET_Condition()
{
	if (Npc_GetTalentSkill (other,NPC_TALENT_PICKPOCKET) == 1) 
	&& (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (Npc_HasItems(self, ItKe_City_Tower_05) >= 1)
	&&  (other.attribute[ATR_DEXTERITY] >= (60 - Theftdiff))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Peck_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Peck_PICKPOCKET);
	Info_AddChoice		(DIA_Peck_PICKPOCKET, DIALOG_BACK 		,DIA_Peck_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Peck_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Peck_PICKPOCKET_DoIt);
};

func void DIA_Peck_PICKPOCKET_DoIt()
{
	if (other.attribute[ATR_DEXTERITY] >= 60)
	{
		B_GiveInvItems (self, other, ItKe_City_Tower_05, 1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP ();
		Info_ClearChoices (DIA_Peck_PICKPOCKET);
	}
	else
	{
		B_ResetThiefLevel();
		AI_StopProcessInfos	(self);
		B_Attack (self, other, AR_Theft, 1); //reagiert trotz IGNORE_Theft mit NEWS
	};
};
	
func void DIA_Peck_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Peck_PICKPOCKET);
};
///////////////////////////////////////////////////////////////////////
//	Info HEY
///////////////////////////////////////////////////////////////////////
instance DIA_Peck_HEY		(C_INFO)
{
	npc			 = 	Mil_324_Peck;
	nr			 = 	2;
	condition	 = 	DIA_Peck_HEY_Condition;
	information	 = 	DIA_Peck_HEY_Info;
	permanent	 = 	TRUE;
	description	 =  "Zdar, jak se vede?";
};
func int DIA_Peck_HEY_Condition ()
{	
	if (MIS_Andre_Peck != LOG_RUNNING)
	&& (Npc_GetDistToWP (self,"NW_CITY_HABOUR_PUFF_PECK") <= 500) 
	{
		return TRUE;
	};
};
func void DIA_Peck_HEY_Info ()
{
	AI_Output (other, self, "DIA_Peck_HEY_15_00"); //Zdar, jak se vede?
	AI_Output (self, other, "DIA_Peck_HEY_12_01"); //Hele, m�m dost pr�ce. Nech m� b�t.
	
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info FOUND_PECK
///////////////////////////////////////////////////////////////////////
instance DIA_Peck_FOUND_PECK		(C_INFO)
{
	npc			 = 	Mil_324_Peck;
	nr			 = 	2;
	condition	 = 	DIA_Peck_FOUND_PECK_Condition;
	information	 = 	DIA_Peck_FOUND_PECK_Info;
	permanent 	 =  FALSE;
	description	 =  "Hej, je nejvy��� �as vyrazit.";
};

func int DIA_Peck_FOUND_PECK_Condition ()
{
	if (MIS_Andre_Peck == LOG_RUNNING)
	&& (Npc_GetDistToWP (self,"NW_CITY_HABOUR_PUFF_PECK") <= 500) 
	{
		return TRUE;
	};
};
func void DIA_Peck_FOUND_PECK_Info ()
{
	AI_Output (other, self, "DIA_Peck_FOUND_PECK_15_00"); //Hej, je nejvy��� �as vyrazit.
	AI_Output (self, other, "DIA_Peck_FOUND_PECK_12_01"); //Co chce�? Nevid�, �e m�m pr�ci?
	AI_Output (other, self, "DIA_Peck_FOUND_PECK_15_02"); //Pot�ebuji zbra�, tak�e se vra� do kas�ren.
	AI_Output (self, other, "DIA_Peck_FOUND_PECK_12_03"); //Sakra, tvoje zbra� m��e po�kat.
	AI_Output (other, self, "DIA_Peck_FOUND_PECK_15_04"); //Poj�, Andre se u� po tob� taky ptal.
	AI_Output (self, other, "DIA_Peck_FOUND_PECK_12_05"); //Hmpf... sakra. Dobr�, v�dy� u� jdu - ale a� bude� Andremu pod�vat hl�en�, ne��kej mu, �e jsem byl tady.
	
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self, "STORAGE");
	Npc_ExchangeRoutine (Vanja, "ALONE");
};
///////////////////////////////////////////////////////////////////////
//	Info WEAPON
///////////////////////////////////////////////////////////////////////
instance DIA_Peck_WEAPON		(C_INFO)
{
	npc			 = 	Mil_324_Peck;
	nr			 = 	2;
	condition	 = 	DIA_Peck_WEAPON_Condition;
	information	 = 	DIA_Peck_WEAPON_Info;
	permanent 	 =  TRUE;
	description	 = 	"P�i�el jsem si pro zbra�.";
};
//------------------------------------
var int DIA_Peck_WEAPON_perm;
//------------------------------------
func int DIA_Peck_WEAPON_Condition ()
{	
	if Npc_KnowsInfo (other, DIA_Andre_FOUND_PECK)
	&& (Npc_GetDistToWP (self, "NW_CITY_ARMORY_PECK") <= 1000)
	&& (Kapitel < 3)
	&& (DIA_Peck_WEAPON_perm == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Peck_WEAPON_Info ()
{
	AI_Output (other, self, "DIA_Peck_WEAPON_15_00"); //P�i�el jsem si pro zbra�.
	
	if (MIS_Andre_Peck == LOG_RUNNING)
	{
		AI_Output (self, other, "DIA_Peck_WEAPON_12_01"); //Nejd��v jdi za lordem Andrem a podej mu hl�en�.
	}
	else	
	{
		if (MIS_Andre_Peck == LOG_OBSOLETE)
		{
			AI_Output (self, other, "DIA_Peck_WEAPON_12_02"); //No, pod�vejme, kdo tady je. N� nov� koleg��ek. A chce zbra�.
			AI_Output (self, other, "DIA_Peck_WEAPON_12_03"); //Ne�ekl jsi Andremu, �e jsem byl v �erven� lucern�. Jsi docela fajn. Na, tady m� me�.
			AI_Output (self ,other,"DIA_Peck_Add_12_00"); //Je to nejlep��, jak� tady m�m.
			B_GiveInvItems 		(self, hero	, ItMw_Schwert1, 1); // edles Schwert 35
	
		}
		else if (MIS_Andre_Peck == LOG_SUCCESS) // ist schon korrekt, das SUCCESS gilt f�r Andre M.F.
		{
			AI_Output (self, other, "DIA_Peck_WEAPON_12_04"); //Nezapomn�l jsem na tebe. Kdo napr�skal Andremu, �e jsem byl v �erven� lucern�?
			AI_Output (self, other, "DIA_Peck_WEAPON_12_05"); //A te� ode mne je�t� chce� me�... dobr�, tady jeden m�. Vezmi si ho. A te� zmiz.
			
			B_GiveInvItems (self, hero, ItMw_1h_MISC_Sword,1);// rostiges Schwert
			
		};
		DIA_Peck_WEAPON_perm = TRUE;
	AI_Output (self, other, "DIA_Peck_WEAPON_12_06"); //Jestli chce� lep�� zbra�, zajdi si na trh ke kupc�m.
	};
	AI_StopProcessInfos (self);
};


// ***************
// B_Peck_LeckMich
// ***************

func void B_Peck_LeckMich()
{
	AI_Output (self ,other,"DIA_Peck_Add_12_07"); //Polib mi! A s rozb�hem!
};


// *********************************************************
// 						zweite Waffe
// *********************************************************
instance DIA_Peck_WEAPON2		(C_INFO)
{
	npc			 = 	Mil_324_Peck;
	nr			 = 	2;
	condition	 = 	DIA_Peck_WEAPON2_Condition;
	information	 = 	DIA_Peck_WEAPON2_Info;
	permanent 	 =  TRUE;
	description	 = 	"Nem�l bys pro m� lep�� zbra�?";
};
//------------------------------------
var int DIA_Peck_WEAPON2_perm;
//------------------------------------
func int DIA_Peck_WEAPON2_Condition ()
{	
	if (other.guild == GIL_MIL)
	&& (Npc_GetDistToWP (self, "NW_CITY_ARMORY_PECK") <= 1000)
	&& (EnterOW_Kapitel2 == TRUE)
	&& (DIA_Peck_WEAPON_perm == TRUE)
	&& (DIA_Peck_WEAPON2_perm == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Peck_WEAPON2_Info ()
{
	AI_Output (self ,other,"DIA_Peck_Add_15_01"); //Nem�l bys pro m� lep�� zbra�?
	if (MIS_Andre_Peck == LOG_SUCCESS) //Peck verpetzt
	{	
		AI_Output (self ,other,"DIA_Peck_Add_12_06"); //Nezapomn�l jsem, �es m� pr�sknul lordu Andremu.
		B_Peck_LeckMich();
	}
	else if (Kapitel < 3)
	{
		AI_Output (self ,other,"DIA_Peck_Add_12_02"); //Te� zrovna ne...
	}
	else
	{
		AI_Output (self ,other,"DIA_Peck_Add_12_03"); //Dob�e �e se pt�. Od Onarov�ch �old�k� m�me p�r opravdu slu�n�ch kousk�.
		AI_Output (self ,other,"DIA_Peck_Add_12_04"); //Jim samotn�m u� nebudou k ni�emu. (o�kliv� se zasm�je)
		AI_Output (self ,other,"DIA_Peck_Add_12_05"); //Na, vem si tenhle.
		B_GiveInvItems (self, other, ItMw_Rubinklinge, 1); //50
		
		DIA_Peck_WEAPON2_perm = TRUE;
	};
};

///////////////////////////////////////////////////////////////////////
//	Info PERM
///////////////////////////////////////////////////////////////////////
instance DIA_Peck_PERM		(C_INFO)
{
	npc			 = 	Mil_324_Peck;
	nr			 = 	998;
	condition	 = 	DIA_Peck_PERM_Condition;
	information	 = 	DIA_Peck_PERM_Info;
	permanent	 =	TRUE;
	description	 = 	"Jsi v po��dku?";
};

func int DIA_Peck_PERM_Condition ()
{	
	if Npc_KnowsInfo (other, DIA_Peck_WEAPON)
	|| (other.guild != GIL_MIL)
	&& (Npc_GetDistToWP (self, "NW_CITY_ARMORY_PECK") <= 1000)
	{
		return TRUE;
	};
};
func void DIA_Peck_PERM_Info ()
{
	AI_Output			(other, self, "DIA_Peck_PERM_15_00"); //V�echno v po��dku?
	
	if (MIS_Andre_Peck == LOG_SUCCESS) //Peck verpetzt
	{	
		B_Peck_LeckMich();
	}
	else if (Kapitel != 3)
	{
		AI_Output			(self, other, "DIA_Peck_PERM_12_01"); //Jo, a co u tebe?
	}
	else if (Kapitel == 3)
	{
		if (MIS_RescueBennet != LOG_SUCCESS)
		{
			if (hero.guild == GIL_MIL)
			|| (hero.guild == GIL_PAL)
			{
				AI_Output			(self, other, "DIA_Peck_PERM_12_02"); //Ne tak docela. D�laj� mi starosti ti �old�ci. Konkr�tn� to, �e se te� ur�it� pokus� vysvobodit sv�ho kamar�da z v�zen�.
				AI_Output			(self, other, "DIA_Peck_PERM_12_03"); //Moc by m� nepot�ilo, kdybych se musel postavit band� zku�en�ch rv���.
			}
			else if (hero.guild == GIL_KDF)
			{
				AI_Output			(self, other, "DIA_Peck_PERM_12_04"); //No samoz�ejm�! V�ichni m�me o�i otev�en�. �arod�jov� mohou b�t uji�t�ni, �e v�ze� nem� ��dnou �anci uniknout.
			}
			else //Sld oder DJG
			{
				AI_Output			(self, other, "DIA_Peck_PERM_12_05"); //V�m, co m� v pl�nu, ale dostat v�zn� na svobodu se ti nepoda��.
			};
		}	
		else
		{
			AI_Output			(self, other, "DIA_Peck_PERM_12_06"); //Jsem r�d, �e se cel� ta z�le�itost kolem vra�dy vyjasnila.
			AI_Output			(other, self, "DIA_Peck_PERM_15_07"); //Pro�?
			AI_Output			(self, other, "DIA_Peck_PERM_12_08"); //Ti �old�ci by asi jen tak bez boje nep�ihl�eli, jak jednoho z nich pov�s�me na �ibenici.
			AI_Output			(self, other, "DIA_Peck_PERM_12_09"); //V nejhor��m p��pad� by na n�s za�to�ili. Rad�ji si ani nechci p�edstavit, co by se stalo potom.
		};	
	};
};







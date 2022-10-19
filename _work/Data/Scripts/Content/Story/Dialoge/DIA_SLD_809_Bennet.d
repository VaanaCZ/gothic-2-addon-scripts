// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Bennet_EXIT   (C_INFO)
{
	npc         = SLD_809_Bennet;
	nr          = 999;
	condition   = DIA_Bennet_EXIT_Condition;
	information = DIA_Bennet_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Bennet_EXIT_Condition()
{
	if (Kapitel < 3)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Bennet_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

// ************************************************************
// 			  				  Hallo 
// ************************************************************
instance DIA_Bennet_HALLO	(C_INFO)
{
	npc		 	= SLD_809_Bennet;
	nr		 	= 1;
	condition	= DIA_Bennet_HALLO_Condition;
	information	= DIA_Bennet_HALLO_Info;
	permanent 	= FALSE;
	important 	= TRUE;
};

func int DIA_Bennet_HALLO_Condition ()
{
	if (Kapitel < 3)
	&& (Npc_IsInState (self, ZS_Talk))
	{
		return TRUE;
	};	
};

func void DIA_Bennet_HALLO_Info ()
{
	AI_Output (self, other, "DIA_Bennet_HALLO_06_00"); //Neprod�v�m ��dn� zbran�. Khaled je prod�v�. Je v dom� s Onarem.
	
	Log_CreateTopic (Topic_SoldierTrader,LOG_NOTE);
	B_LogEntry (Topic_SoldierTrader,"Khaled prod�v� zbran�.");
};

// ************************************************************
// 			  				TRADE 
// ************************************************************
instance DIA_Bennet_TRADE		(C_INFO)
{
	npc			= SLD_809_Bennet;
	nr          = 700;
	condition	= DIA_Bennet_TRADE_Condition;
	information	= DIA_Bennet_TRADE_Info;
	permanent	= TRUE;
	description	= "M��e� mi prodat n�jak� v�ci na kov�n�?";
	trade		= TRUE;
};

func int DIA_Bennet_TRADE_Condition ()
{
	if ((Kapitel != 3) || (MIS_RescueBennet == LOG_SUCCESS))		//damit Bennet dir im Knast kein Schmieden beibringt
	{
		return TRUE;
	};
};

func void DIA_Bennet_TRADE_Info ()
{
	AI_Output (other, self, "DIA_Bennet_TRADE_15_00"); //M��e� mi prodat n�jak� v�ci na kov�n�?
	B_GiveTradeInv (self);

	//Joly: Mc ArrowBolt
	//////////////////////////////////////////////////////////////////////////////////////
	Npc_RemoveInvItems	(self, ItRw_Bolt, Npc_HasItems (self,ItRw_Bolt) );
	var int McBolzenAmount;
	McBolzenAmount = (Kapitel * 50);
	CreateInvItems 	(self, ItRw_Bolt, McBolzenAmount );
	
	Npc_RemoveInvItems	(self, ItRw_Arrow, Npc_HasItems (self,ItRw_Arrow) );
	var int McArrowAmount;
	McArrowAmount = (Kapitel * 50);
	CreateInvItems 	(self, ItRw_Arrow, McArrowAmount );
	//////////////////////////////////////////////////////////////////////////////////////

	AI_Output (self, other, "DIA_Bennet_TRADE_06_01"); //Co pot�ebuje�?
	
	if (BennetLOG == FALSE)
	{
		Log_CreateTopic (Topic_SoldierTrader,LOG_NOTE);
		B_LogEntry (Topic_SoldierTrader,"Bennet prod�v� kov��sk� n��in�.");
		BennetLOG = TRUE;
	};
};

// ************************************************************
// 			  				WhichWeapons 
// ************************************************************
instance DIA_Bennet_WhichWeapons (C_INFO)
{
	npc			= SLD_809_Bennet;
	nr          = 2;
	condition	= DIA_Bennet_WhichWeapons_Condition;
	information	= DIA_Bennet_WhichWeapons_Info;
	permanent	= FALSE;
	description	= "Jak� zbran� vyr�b�?";
};

func int DIA_Bennet_WhichWeapons_Condition ()
{
	if ((Kapitel != 3) || (MIS_RescueBennet == LOG_SUCCESS))
	&& (MIS_Bennet_BringOre == FALSE)
	{
		return TRUE;
	};	
};

func void DIA_Bennet_WhichWeapons_Info ()
{
	AI_Output (other, self, "DIA_Bennet_WhichWeapons_15_00"); //Jak� zbran� vyr�b�?
	AI_Output (self, other, "DIA_Bennet_WhichWeapons_06_01"); //V tuhle chv�li oby�ejn� me�e, nic jin�ho.
	AI_Output (self, other, "DIA_Bennet_WhichWeapons_06_02"); //Ale kdybych m�l trochu magick� rudy, mohl bych ukovat zbran�, kter� jsou mnohem lep�� ne� v�echny srovnateln� zbran� vyroben� z norm�ln� star� oceli.
	AI_Output (self, other, "DIA_Bennet_WhichWeapons_06_03"); //Nev� n�hodou, kde bych tady v okol� n�jakou na�el? (sm�je se) M�m na mysli krom� Hornick�ho �dol� samoz�ejm�.
	AI_Output (other, self, "DIA_Bennet_WhichWeapons_15_04"); //Ne.
	AI_Output (self, other, "DIA_Bennet_WhichWeapons_06_05"); //Samoz�ejm� ne.
};

// ************************************************************
// 			  				BauOrSld 
// ************************************************************
instance DIA_Bennet_BauOrSld (C_INFO)
{
	npc			= SLD_809_Bennet;
	nr          = 3;
	condition	= DIA_Bennet_BauOrSld_Condition;
	information	= DIA_Bennet_BauOrSld_Info;
	permanent	= FALSE;
	description	= "Pat�� k roln�k�m, nebo k �old�k�m?";
};

func int DIA_Bennet_BauOrSld_Condition ()
{
	return TRUE;
};

func void DIA_Bennet_BauOrSld_Info ()
{
	AI_Output (other, self, "DIA_Bennet_BauOrSld_15_00"); //Pat�� k roln�k�m, nebo k �old�k�m?
	AI_Output (self, other, "DIA_Bennet_BauOrSld_06_01"); //Ty si ze m� utahuje�, �e jo?
	AI_Output (other, self, "DIA_Bennet_BauOrSld_15_02"); //Byl jsem jenom zv�dav�.
	AI_Output (self, other, "DIA_Bennet_BauOrSld_06_03"); //U� jsi n�kdy vid�l farm��e kovat zbran�?
	AI_Output (other, self, "DIA_Bennet_BauOrSld_15_04"); //Ne.
	AI_Output (self, other, "DIA_Bennet_BauOrSld_06_05"); //Tak pro� mi d�v� tak hloup� ot�zky?
};

// ************************************************************
// 			  				WannaJoin 
// ************************************************************
instance DIA_Bennet_WannaJoin (C_INFO)
{
	npc			= SLD_809_Bennet;
	nr          = 4;
	condition	= DIA_Bennet_WannaJoin_Condition;
	information	= DIA_Bennet_WannaJoin_Info;
	permanent	= TRUE;
	description	= "Chci se p�idat k �oldn���m!";
};

func int DIA_Bennet_WannaJoin_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Bennet_BauOrSld))
	&& (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Bennet_WannaJoin_Info ()
{
	AI_Output (other, self, "DIA_Bennet_WannaJoin_15_00"); //Chci se p�idat k �oldn���m!
	AI_Output (self, other, "DIA_Bennet_WannaJoin_06_01"); //P�esta� �vanit, b� za Torlofem a nech ho, a� ti d� test.
	if (MIS_Torlof_HolPachtVonSekob == LOG_SUCCESS)
	|| (MIS_Torlof_BengarMilizKlatschen == LOG_SUCCESS)
	{
		AI_Output (other, self, "DIA_Bennet_WannaJoin_15_02"); //Pro�el jsem zkou�kou.
		AI_Output (self, other, "DIA_Bennet_WannaJoin_06_03"); //Dob�e, tak to pro tebe budu hlasovat.
	};
};

// ************************************************************
// 			  				WannaSmith 
// ************************************************************

instance DIA_Bennet_WannaSmith (C_INFO)
{
	npc			= SLD_809_Bennet;
	nr          = 5;
	condition	= DIA_Bennet_WannaSmith_Condition;
	information	= DIA_Bennet_WannaSmith_Info;
	permanent	= TRUE;
	description	= "M��e� m� nau�it, jak ukovat me�?";
};

func int DIA_Bennet_WannaSmith_Condition ()
{
	if (PLAYER_TALENT_SMITH[WEAPON_Common] == FALSE)
	&& (Bennet_TeachCommon == FALSE)
	&& ((Kapitel != 3) || (MIS_RescueBennet == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Bennet_WannaSmith_Info ()
{
	AI_Output (other, self, "DIA_Bennet_WannaSmith_15_00"); //M��e� m� nau�it, jak ukovat me�?
	AI_Output (self, other, "DIA_Bennet_WannaSmith_06_01"); //Jasn�.
	AI_Output (self, other, "DIA_Bennet_WannaSmith_06_02"); //To t� bude n�co st�t. �ekn�me 30 zlat�ch.
	
	Info_ClearChoices (DIA_Bennet_WannaSmith);
	Info_AddChoice (DIA_Bennet_WannaSmith, "Mo�n� pozd�ji.", DIA_Bennet_WannaSmith_Later);
	Info_AddChoice (DIA_Bennet_WannaSmith, "Dob�e. Tady m� 30 zlatek.", DIA_Bennet_WannaSmith_Pay);
};

func void DIA_Bennet_WannaSmith_Pay()
{
	AI_Output (other, self, "DIA_Bennet_WannaSmith_Pay_15_00"); //Dob�e. Tady m� 30 zlatek.
	
	if (B_GiveInvItems (other, self, itmi_gold, 30))
	{
		AI_Output (self, other, "DIA_Bennet_WannaSmith_Pay_06_01"); //A to byla taky zatracen� dobr� cena! M��eme za��t, jakmile bude� p�ipraven.
		
		Bennet_TeachCommon = TRUE;
		Log_CreateTopic (Topic_SoldierTeacher,LOG_NOTE);
		B_LogEntry (Topic_SoldierTeacher,"Bennet m� nau�� kov��sk�mu um�n�.");
	}
	else
	{
		AI_Output (self, other, "DIA_Bennet_WannaSmith_Pay_06_02"); //P�esta� se chovat jako naivka. ��k�m 30 a ani o minci m��.
	};
	Info_ClearChoices (DIA_Bennet_WannaSmith);
};

func void DIA_Bennet_WannaSmith_Later()
{
	AI_Output (other, self, "DIA_Bennet_WannaSmith_Later_15_00"); //Mo�n� pozd�ji.
	Info_ClearChoices (DIA_Bennet_WannaSmith);
};


// ************************************************************
// 			  				Teach COMMON 
// ************************************************************
instance DIA_Bennet_TeachCOMMON (C_INFO)
{
	npc			= SLD_809_Bennet;
	nr          = 6;
	condition	= DIA_Bennet_TeachCOMMON_Condition;
	information	= DIA_Bennet_TeachCOMMON_Info;
	permanent	= TRUE;
	description	= B_BuildLearnString("Nau�it se kov��stv�", B_GetLearnCostTalent(other, NPC_TALENT_SMITH, WEAPON_Common));
};

func int DIA_Bennet_TeachCOMMON_Condition ()
{
	if (PLAYER_TALENT_SMITH[WEAPON_Common] == FALSE)
	&& (Bennet_TeachCommon == TRUE)
	&& ((Kapitel != 3) || (MIS_RescueBennet == LOG_SUCCESS))		//damit Bennet dir im Knast kein Schmieden beibringt
	{
		return TRUE;
	};
};

func void DIA_Bennet_TeachCOMMON_Info ()
{
	AI_Output (other, self, "DIA_Bennet_TeachCOMMON_15_00"); //Nau� mne ukovat me�!
	
	if (B_TeachPlayerTalentSmith (self, other, WEAPON_Common))
	{
		AI_Output (self, other, "DIA_Bennet_TeachCOMMON_06_01"); //Je to celkem jednoduch�: Vezmi kus surov�ho �eleza a dr� ho v ohni, dokud se neroz�hav�.
		AI_Output (self, other, "DIA_Bennet_TeachCOMMON_06_02"); //Pak ho polo� na kovadlinu a roztepej �epel do pot�ebn�ho tvaru.
		AI_Output (self, other, "DIA_Bennet_TeachCOMMON_06_03"); //Hlavn� mus� d�vat pozor, aby �epel p��li� nevychladla. Na opracov�n� zbran� m� v�dycky jenom p�r minut �asu.
		AI_Output (self, other, "DIA_Bennet_TeachCOMMON_06_04"); //Na zbytek p�ijde� s�m - je to jenom ot�zka praxe.
	};
};

// ************************************************************
// 			  				WannaSmithORE
// ************************************************************
instance DIA_Bennet_WannaSmithORE (C_INFO)
{
	npc			= SLD_809_Bennet;
	nr          = 7;
	condition	= DIA_Bennet_WannaSmithORE_Condition;
	information	= DIA_Bennet_WannaSmithORE_Info;
	permanent	= TRUE;
	description	= "Nau� mne, jak ukovat zbran� z magick� rudy!";
};

func int DIA_Bennet_WannaSmithORE_Condition ()
{
	if (Bennet_TeachSmith == FALSE)
	&& ((Kapitel != 3) || (MIS_RescueBennet == LOG_SUCCESS))	
	{
		return TRUE;
	};
};

func void DIA_Bennet_WannaSmithORE_Info ()
{
	AI_Output (other, self, "DIA_Bennet_WannaSmithORE_15_00"); //Nau� mne kovat zbran� z magick� rudy!
		
	if (PLAYER_TALENT_SMITH[WEAPON_Common] == FALSE)
	{
		AI_Output (self, other, "DIA_Bennet_WannaSmithORE_06_01"); //Ale ty nezn� v�bec ani z�klady.
		AI_Output (self, other, "DIA_Bennet_WannaSmithORE_06_02"); //Nejd��v se mus� nau�it ukovat oby�ejn� me�. Pak uvid�me.
	}
	else if (other.guild != GIL_SLD)
	&& 		(other.guild != GIL_DJG)
	{
		AI_Output (self, other, "DIA_Bennet_WannaSmithORE_06_03"); //Proto�e nejsi jedn�m z n�s, tak bych byl v h�ji, kdybych ti vyzradil tajemstv� zbran� z magick� rudy.
		AI_Output (self, other, "DIA_Bennet_WannaSmithORE_06_04"); //Pouze velmi m�lo kov�ren tohle v�echno um�, a j� v���m, �e to nedok�� dokonce ani kov��i ve m�st�.
		AI_Output (self, other, "DIA_Bennet_WannaSmithORE_06_05"); //A to je taky dob�e. Jinak by v�ichni ty m�stsk� ochlastov� ve str�i nosili magick� me�e.
		if (other.guild == GIL_MIL)
		{	
			AI_Output (self, other, "DIA_Bennet_WannaSmithORE_06_06"); //Nic proti tob�. (k�en� se) Vypad�, �e jsi v pohod�.
		};
	}
	else if (MIS_Bennet_BringOre != LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_Bennet_WannaSmithORE_06_07"); //Kdybych m�l magickou rudu, dokonce i j� bych to tak ud�lal.
		AI_Output (other, self, "DIA_Bennet_WannaSmithORE_15_08");//Ale, no t��k - jsem s �old�kama a um�m kovat - co jin�ho chce�?
		AI_Output (self, other, "DIA_Bennet_WannaSmithORE_06_09"); //M��e� mi tedy potom ��ct, jak m�m ukovat zbra� z magick� rudy bez pou�it� magick� rudy?
		AI_Output (other, self, "DIA_Bennet_WannaSmithORE_15_10");//Noooo...
		AI_Output (self, other, "DIA_Bennet_WannaSmithORE_06_11"); //To jsem si myslel. Pot�ebuju nejm�n� 5 hrudek t� rudy - nebo na to rovnou zapome�.
		if (MIS_Bennet_BringOre == FALSE)
		{
			MIS_Bennet_BringOre = LOG_RUNNING;
		};
	}
	else //alles OK
	{
		AI_Output (self, other, "DIA_Bennet_WannaSmithORE_06_12"); //Skv�le, p�inesl jsi mi rudu a tak� v�, jak ukovat norm�ln� me�.
		AI_Output (other, self, "DIA_Bennet_WannaSmithORE_15_13");//No, tak tedy pov�dej.
		AI_Output (self, other, "DIA_Bennet_WannaSmithORE_06_14"); //Nejd�le�it�j�� v�c je: Nez�le�� na tom, zdali je tv� cel� zbra� vyroben� z magick� rudy, nebo jestli m� pokrytou jen oby�ejnou ocelovou �epel vrstvou rudy. Povrch je to, na �em z�le��.
		AI_Output (self, other, "DIA_Bennet_WannaSmithORE_06_15"); //A proto�e je ten mizernej materi�l tak drahej, popadni ocelovej prut a pou�ij p�r hrud rudy.
		AI_Output (self, other, "DIA_Bennet_WannaSmithORE_06_16"); //P�irozen� z toho nevznikne nic jin�ho, ne� �e to jenom pokryje hotov� me� magickou rudou. Bude� muset ukovat ten me� od za��tku.
		AI_Output (self, other, "DIA_Bennet_WannaSmithORE_06_17"); //V�echno ostatn� z�vis� na zbrani, kterou chce� vyrobit.
		Bennet_TeachSmith = TRUE;
	};
};

// ************************************************************
// 			  				WhereOre
// ************************************************************
instance DIA_Bennet_WhereOre (C_INFO)
{
	npc			= SLD_809_Bennet;
	nr          = 8;
	condition	= DIA_Bennet_WhereOre_Condition;
	information	= DIA_Bennet_WhereOre_Info;
	permanent	= FALSE;
	description	= "Kde mohu naj�t magickou rudu?";
};

func int DIA_Bennet_WhereOre_Condition ()
{
	if (MIS_Bennet_BringOre == LOG_RUNNING)
	&& ((Kapitel != 3) || (MIS_RescueBennet == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Bennet_WhereOre_Info ()
{
	AI_Output (other, self, "DIA_Bennet_WhereOre_15_00"); //Kde m��u naj�t magickou rudu?
	AI_Output (self, other, "DIA_Bennet_WhereOre_06_01"); //No, kdybych tohle jenom v�d�l. N�jak� ur�it� bude v t�a�sk� kolonii.
	AI_Output (self, other, "DIA_Bennet_WhereOre_06_02"); //Ale mo�n� bude� m�t �t�st� a najde� tady v okol� p�r zbytk�.
	AI_Output (self, other, "DIA_Bennet_WhereOre_06_03"); //Mysl�m, �e v hor�ch ji�n� odsud jsou n�jak� doly. Mo�n� �e bys tam m�l v�t�� �t�st�.
	AI_Output (self, other, "DIA_Bennet_WhereOre_06_04"); //Ale d�vej bacha, sly�el jsem, �e se to tam hem�� banditama.
};

// ************************************************************
// 			  				BringOre
// ************************************************************
instance DIA_Bennet_BringOre (C_INFO)
{
	npc			= SLD_809_Bennet;
	nr          = 9;
	condition	= DIA_Bennet_BringOre_Condition;
	information	= DIA_Bennet_BringOre_Info;
	permanent	= FALSE;
	description	= "Tum� - 5 kousk� rudy.";
};

func int DIA_Bennet_BringOre_Condition ()
{
	if (MIS_Bennet_BringOre == LOG_RUNNING)
	&& (Npc_HasItems (other,ItMi_Nugget) >= 5)
	{
		return TRUE;
	};
};

func void DIA_Bennet_BringOre_Info ()
{
	AI_Output (other, self, "DIA_Bennet_BringOre_15_00"); //Tady m� - 5 zlat�ch.
	AI_Output (self, other, "DIA_Bennet_BringOre_06_01"); //(sm�je se) Uka�!
	B_GiveInvItems (other, self, itmi_nugget, 5);
	AI_Output (self, other, "DIA_Bennet_BringOre_06_02"); //Skute�n�! Tohle m� fakt srazilo k zemi!
	AI_Output (self, other, "DIA_Bennet_BringOre_06_03"); //Dv� si nech. Bude� je pot�ebovat, abys mohl ukovat svoj� vlastn� zbra�.
	B_GiveInvItems (self,other, itmi_nugget, 2);
	MIS_Bennet_BringOre = LOG_SUCCESS;
};

// ************************************************************
// 			  				  Teach 
// ************************************************************
var int Bennet_Kap2Smith;
var int Bennet_Kap3Smith;
var int Bennet_Kap4Smith;
var int Bennet_Kap5Smith;
// ---------------------------------

FUNC VOID B_SayBennetLATER()
{
	AI_Output	(self, other, "DIA_Bennet_GetInnosEye_06_04"); //Ne, je�t� ne. Vra� se pozd�ji.
};
instance DIA_Bennet_TeachSmith		(C_INFO)
{
	npc		 	= SLD_809_Bennet;
	nr		 	= 30;
	condition	= DIA_Bennet_TeachSmith_Condition;
	information	= DIA_Bennet_TeachSmith_Info;
	permanent	= TRUE;
	description	= "Cht�l bych um�t kovat zbran� z magick� rudy.";
};

func int DIA_Bennet_TeachSmith_Condition ()
{
	if (Bennet_TeachSmith == TRUE)
	&& ((Kapitel != 3) || (MIS_RescueBennet == LOG_SUCCESS))		//damit Bennet dir im Knast kein Schmieden beibringt
	{
		return TRUE;
	};
};

func void DIA_Bennet_TeachSmith_Info ()
{
	AI_Output (other, self, "DIA_Bennet_TeachSmith_15_00"); //Chci v�d�t v�c o kut� zbran� z magick� rudy.
	
	if (Kapitel == 1)//HACK Mattes  
	{
		B_SayBennetLATER();
	}
	else if (Kapitel == 2)
	&& (Bennet_Kap2Smith == FALSE)
	{
		AI_Output (self, other, "DIA_Bennet_TeachSmith_06_01"); //Mohu t� nau�it, jak kovat me�e z magick� rudy nebo dokonce obouru�n� zbran�.
		Bennet_Kap2Smith = TRUE;
	}
	else if (Kapitel == 3)
	&& (MIS_ReadyForChapter4 == FALSE)
	&& (Bennet_Kap3Smith == FALSE)
	{
		AI_Output (self, other, "DIA_Bennet_TeachSmith_06_02"); //Zdokonalil jsem svoj� techniku. Nyn� t� mohu nau�it, jak vytvo�it s pomoc� rudy t�k� me�e nebo t�k� obouru�n� me�e.
		Bennet_Kap3Smith = TRUE;
	}
	else if (MIS_ReadyForChapter4 == TRUE)
	&& (Kapitel < 5)
	&& (Bennet_Kap4Smith == FALSE)
	{
		AI_Output (self, other, "DIA_Bennet_TeachSmith_06_03"); //Mysl�m, �e jsem se tentokr�t p�ekonal. Vytvo�il jsem dv� bojov� �epele. To je ta nejlep�� v�c, jakou jsem dote� vid�l.
		Bennet_Kap4Smith = TRUE;
	}
	else if (Kapitel >= 5)
	&& (Bennet_Kap5Smith == FALSE)
	{
		AI_Output (self, other, "DIA_Bennet_TeachSmith_06_04"); //Posly�. Mysl�m, �e jsem pr�v� dostal dokonal� n�pad. Zbran� z magick� rudy, zakalen� dra�� krv�. A j� p�esn� v�m, jak na to p�jdu!
		AI_Output (self, other, "DIA_Bennet_TeachSmith_06_05"); //(zub� se) Chce� to v�d�t?
		Bennet_Kap5Smith = TRUE;
	}
	else
	{
		AI_Output (self, other, "DIA_Bennet_TeachSmith_06_06"); //Jakou zbra� bys cht�l vyrobit?
	};
	
	Info_ClearChoices (DIA_Bennet_TeachSmith);
	Info_AddChoice (DIA_Bennet_TeachSmith, DIALOG_BACK, DIA_Bennet_TeachSmith_BACK);
	// ------ Kapitel 2 ------
	if (PLAYER_TALENT_SMITH[WEAPON_1H_Special_01] == FALSE)
	&& (Kapitel >= 2) 
	{
		Info_AddChoice		(DIA_Bennet_TeachSmith, B_BuildLearnString(NAME_ItMw_1H_Special_01 , B_GetLearnCostTalent(other, NPC_TALENT_SMITH, WEAPON_1H_Special_01))		,DIA_Bennet_TeachSmith_1hSpecial1);
	};
	if (PLAYER_TALENT_SMITH[WEAPON_2H_Special_01] == FALSE)
	&& (Kapitel >= 2) 
	{
		Info_AddChoice		(DIA_Bennet_TeachSmith, B_BuildLearnString(NAME_ItMw_2H_Special_01, B_GetLearnCostTalent(other, NPC_TALENT_SMITH, WEAPON_2H_Special_01))		,DIA_Bennet_TeachSmith_2hSpecial1);
	};
	// ------ Kapitel 3 ------
	if (PLAYER_TALENT_SMITH[WEAPON_1H_Special_02] == FALSE)
	&& (Kapitel >= 3)
	{
		Info_AddChoice		(DIA_Bennet_TeachSmith, B_BuildLearnString(NAME_ItMw_1H_Special_02, B_GetLearnCostTalent(other, NPC_TALENT_SMITH, WEAPON_1H_Special_02))		,DIA_Bennet_TeachSmith_1hSpecial2);
	};
	if (PLAYER_TALENT_SMITH[WEAPON_2H_Special_02] == FALSE)
	&& (Kapitel >= 3)
	{
		Info_AddChoice		(DIA_Bennet_TeachSmith, B_BuildLearnString(NAME_ItMw_2H_Special_02, B_GetLearnCostTalent(other, NPC_TALENT_SMITH, WEAPON_2H_Special_02))		,DIA_Bennet_TeachSmith_2hSpecial2);
	};
	// ------ Kapitel 4 ------
	if (PLAYER_TALENT_SMITH[WEAPON_1H_Special_03] == FALSE)
	&& (Kapitel >= 4)
	{
		Info_AddChoice		(DIA_Bennet_TeachSmith, B_BuildLearnString(NAME_ItMw_1H_Special_03, B_GetLearnCostTalent(other, NPC_TALENT_SMITH, WEAPON_1H_Special_03))		,DIA_Bennet_TeachSmith_1hSpecial3);
	};
	if (PLAYER_TALENT_SMITH[WEAPON_2H_Special_03] == FALSE)
	&& (Kapitel >= 4)
	{
		Info_AddChoice		(DIA_Bennet_TeachSmith, B_BuildLearnString(NAME_ItMw_2H_Special_03, B_GetLearnCostTalent(other, NPC_TALENT_SMITH, WEAPON_2H_Special_03))		,DIA_Bennet_TeachSmith_2hSpecial3);
	};
	// ------ Kapitel 5 ------
	if (PLAYER_TALENT_SMITH[WEAPON_1H_Special_04] == FALSE)
	&& (Kapitel >= 5)
	{
		Info_AddChoice		(DIA_Bennet_TeachSmith, B_BuildLearnString(NAME_ItMw_1H_Special_04, B_GetLearnCostTalent(other, NPC_TALENT_SMITH, WEAPON_1H_Special_04))		,DIA_Bennet_TeachSmith_1hSpecial4);
	};  
	if (PLAYER_TALENT_SMITH[WEAPON_2H_Special_04] == FALSE)
	&& (Kapitel >= 5)
	{
		Info_AddChoice		(DIA_Bennet_TeachSmith, B_BuildLearnString(NAME_ItMw_2H_Special_04, B_GetLearnCostTalent(other, NPC_TALENT_SMITH, WEAPON_2H_Special_04))		,DIA_Bennet_TeachSmith_2hSpecial4);
	};
};

FUNC VOID DIA_Bennet_TeachSmith_Back ()
{
	Info_ClearChoices (DIA_Bennet_TeachSmith);
};
func VOID DIA_Bennet_TeachSmith_1hSpecial1 ()
{
	
	B_TeachPlayerTalentSmith (self, other, WEAPON_1H_Special_01);	
};
FUNC VOID DIA_Bennet_TeachSmith_2hSpecial1 ()
{

	B_TeachPlayerTalentSmith (self, other, WEAPON_2H_Special_01);
};
FUNC VOID DIA_Bennet_TeachSmith_1hSpecial2 ()
{

	B_TeachPlayerTalentSmith (self, other, WEAPON_1H_Special_02);
};
FUNC VOID DIA_Bennet_TeachSmith_2hSpecial2 ()
{

	B_TeachPlayerTalentSmith (self, other, WEAPON_2H_Special_02);
};
FUNC VOID DIA_Bennet_TeachSmith_1hSpecial3 ()
{

	B_TeachPlayerTalentSmith (self, other, WEAPON_1H_Special_03);
};
FUNC VOID DIA_Bennet_TeachSmith_2hSpecial3 ()
{

	B_TeachPlayerTalentSmith (self, other, WEAPON_2H_Special_03);
};
FUNC VOID DIA_Bennet_TeachSmith_1hSpecial4 ()
{
	
	B_TeachPlayerTalentSmith (self, other, WEAPON_1H_Special_04);
};
FUNC VOID DIA_Bennet_TeachSmith_2hSpecial4 ()
{

	B_TeachPlayerTalentSmith(self, other, WEAPON_2H_Special_04);
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

INSTANCE DIA_Bennet_KAP3_EXIT(C_INFO)
{
	npc			= SLD_809_Bennet;
	nr			= 999;
	condition	= DIA_Bennet_KAP3_EXIT_Condition;
	information	= DIA_Bennet_KAP3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Bennet_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Bennet_KAP3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};


//*********************************************************************
//	Was machst du hier im Knast?
//*********************************************************************
instance DIA_Bennet_WhyPrison		(C_INFO)
{
	npc		 	 = 	SLD_809_Bennet;
	nr           = 	8;
	condition	 = 	DIA_Bennet_WhyPrison_Condition;
	information	 = 	DIA_Bennet_WhyPrison_Info;
	permanent	 = 	FALSE;
	description	 = 	"A pro� ses vlastn� dostal do lochu?";
};

func int DIA_Bennet_WhyPrison_Condition ()
{
	IF (Kapitel == 3)
	&& (MIS_RescueBennet != LOG_SUCCESS)
	{
		return TRUE;
	};	
};

func void DIA_Bennet_WhyPrison_Info ()
{
	AI_Output	(other, self ,"DIA_Bennet_WhyPrison_15_00"); //Za co ses dostal do lochu?
	AI_Output	(self , other,"DIA_Bennet_WhyPrison_06_01"); //Ty svin� m� hodily do t�hle d�ry. Pr� jsem zavra�dil paladina.
	AI_Output 	(self ,other ,"DIA_Bennet_WhyPrison_06_02"); //Ale j� jsem to neud�lal, oni se to jenom pokou�� na m� hodit.
	AI_Output	(other, self ,"DIA_Bennet_WhyPrison_15_03"); //Pro� by to d�lali?
	AI_Output 	(self ,other ,"DIA_Bennet_WhyPrison_06_04"); //Jak to m�m v�d�t? M�l bys m� odtud dostat.
	AI_Output 	(self ,other ,"DIA_Bennet_WhyPrison_06_05"); //Promluv s lordem Hagenem, probourej ze�, je to jedno - prost� n�co ud�lej!
	
	MIS_RescueBennet = LOG_RUNNING; 
	Log_CreateTopic (TOPIC_RESCUEBENNET, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_RESCUEBENNET, LOG_RUNNING);
	B_LogEntry (TOPIC_RESCUEBENNET,"Bennet je v p�kn� brynd� a te� by ud�lal cokoliv, jen aby se dostal z basy."); 
};

//*********************************************************************
//	Was ist passiert?
//*********************************************************************
instance DIA_Bennet_WhatHappened		(C_INFO)
{
	npc		 	 = 	SLD_809_Bennet;
	nr           = 	8;
	condition	 = 	DIA_Bennet_WhatHappened_Condition;
	information	 = 	DIA_Bennet_WhatHappened_Info;
	permanent	 = 	FALSE;
	description	 = 	"Co se stalo?";
};

func int DIA_Bennet_WhatHappened_Condition ()
{
	IF (MIS_RescueBennet == LOG_RUNNING)
	&& (Npc_KnowsInfo (other,DIA_Bennet_WhyPrison))
	{
		return TRUE;
	};	
};

func void DIA_Bennet_WhatHappened_Info ()
{
	AI_Output	(other, self ,"DIA_Bennet_WhatHappened_15_00"); //Co se stalo?
	AI_Output	(self , other,"DIA_Bennet_WhatHappened_06_01"); //�el jsem do centra s Hodgesem nakoupit n�jak� z�soby pro na�e chlapce.
	AI_Output 	(self ,other ,"DIA_Bennet_WhatHappened_06_02"); //Najednou jsme usly�eli hlasit� v�k�ik a zvuk, jako by n�kdo b�el.
	AI_Output	(other, self ,"DIA_Bennet_WhatHappened_15_03"); //Jdi p��mo k v�ci.
	AI_Output 	(self ,other ,"DIA_Bennet_WhatHappened_06_04"); //V�d�li jsme najednou, �e se n�co stalo a �e n�s chyt�, kdy� n�s tam n�kdo uvid�.
	AI_Output 	(self ,other ,"DIA_Bennet_WhatHappened_06_05"); //B�eli jsme jak o �ivot. Potom, t�sn� p�edt�m, ne� jsme dob�hli k m�stsk� br�n�, jsem zakopnul a vyvrknul jsem si kotn�k.
	AI_Output 	(self ,other ,"DIA_Bennet_WhatHappened_06_06"); //Zbytek je u� jednoduchej. Najednou u m� byla domobrana, a ta m� odvlekla rovnou do t�hle d�ry.
};

//*********************************************************************
//	Wer ist ermordet worden?
//*********************************************************************
instance DIA_Bennet_Victim		(C_INFO)
{
	npc		 	 = 	SLD_809_Bennet;
	nr           = 	8;
	condition	 = 	DIA_Bennet_Victim_Condition;
	information	 = 	DIA_Bennet_Victim_Info;
	permanent	 = 	FALSE;
	description	 = 	"Kdo byl zavra�d�n?";
};

func int DIA_Bennet_Victim_Condition ()
{
	IF (MIS_RescueBennet == LOG_RUNNING)
	&& (Npc_KnowsInfo (other,DIA_Bennet_WhyPrison))
	{
		return TRUE;
	};	
};

func void DIA_Bennet_Victim_Info ()
{
	AI_Output	(other, self ,"DIA_Bennet_Victim_15_00"); //Kdo byl zavra�d�n?
	AI_Output	(self , other,"DIA_Bennet_Victim_06_01"); //Nem�m pon�t� - jeden z paladin�, v�bec je nezn�m.
	AI_Output	(other, self ,"DIA_Bennet_Victim_15_02"); //Jak se jmenoval?
	AI_Output 	(self ,other ,"DIA_Bennet_Victim_06_03"); //N�jak� Lothar, mysl�m. No, nev�m, opravdu si nejsem jistej.
	AI_Output 	(self ,other ,"DIA_Bennet_Victim_06_04"); //Rad�i by ses m�l zeptat lorda Hagena, on zn� v�echny detaily.

	B_LogEntry (TOPIC_RESCUEBENNET,"Lothar, jeden z paladin�, byl zavra�d�n. Bli��� informaci by mi mohl podat Lord Hagen, kter� vede cel� vy�et�ov�n�.");
};

//*********************************************************************
//	Haben sie Beweise gegen dich?
//*********************************************************************
instance DIA_Bennet_Evidence		(C_INFO)
{
	npc		 	 = 	SLD_809_Bennet;
	nr           = 	8;
	condition	 = 	DIA_Bennet_Evidence_Condition;
	information	 = 	DIA_Bennet_Evidence_Info;
	permanent	 = 	FALSE;
	description	 = 	"Maj� proti tob� n�jak� d�kaz?";
};

func int DIA_Bennet_Evidence_Condition ()
{
	IF (MIS_RescueBennet == LOG_RUNNING)
	&& (Npc_KnowsInfo (other,DIA_Bennet_WhyPrison))
	{
		return TRUE;
	};	
};

func void DIA_Bennet_Evidence_Info ()
{
	AI_Output	(other, self ,"DIA_Bennet_Evidence_15_00"); //Maj� proti tob� n�jak� d�kaz?
	AI_Output	(self , other,"DIA_Bennet_Evidence_06_01"); //��kaj�, �e maj� n�jak�ho sv�dka, kter� m� poznal.
	AI_Output	(other, self ,"DIA_Bennet_Evidence_15_02"); //Nev� n�hodou, kdo je ten sv�dek?
	AI_Output 	(self ,other ,"DIA_Bennet_Evidence_06_03"); //Ne. V�echno, co v�m, je, �e je to lh��.
	
	B_LogEntry (TOPIC_RESCUEBENNET,"Jeden sv�dek tvrd�, �e Benneta vid�l. Mus�m ho naj�t a zjistit, jak to bylo doopravdy.");
	
	RescueBennet_KnowsWitness = TRUE; 
};


//*********************************************************************
//	Wer f�hrt die Untersuchungen durch?
//*********************************************************************
instance DIA_Bennet_Investigation		(C_INFO)
{
	npc		 	 = 	SLD_809_Bennet;
	nr           = 	8;
	condition	 = 	DIA_Bennet_Investigation_Condition;
	information	 = 	DIA_Bennet_Investigation_Info;
	permanent	 = 	FALSE;
	description	 = 	"Kdo vede vy�et�ov�n�?";
};

func int DIA_Bennet_Investigation_Condition ()
{
	IF (MIS_RescueBennet == LOG_RUNNING)
	&& (Npc_KnowsInfo (other,DIA_Bennet_Evidence))
	{
		return TRUE;
	};	
};

func void DIA_Bennet_Investigation_Info ()
{
	AI_Output	(other, self ,"DIA_Bennet_Investigation_15_00"); //Kdo vede vy�et�ov�n�?
	AI_Output	(self , other,"DIA_Bennet_Investigation_06_01"); //S�m lord Hagen. A proto�e ob�t� byl jeden z paladin�, spad� tenhle p��pad pod v�le�n� soud.
	AI_Output	(other, self ,"DIA_Bennet_Investigation_15_02"); //Co to znamen�?
	AI_Output 	(self ,other ,"DIA_Bennet_Investigation_06_03"); //To je jednoduch� uhodnout. Pokud se odtud nedostanu, bez okolk� m� pov�s�.
	AI_Output 	(self ,other ,"DIA_Bennet_Investigation_06_04"); //Mus� mi pomoct, nebo tady bude v�lka. Lee to nenech� jen tak.
	AI_Output 	(self ,other ,"DIA_Bennet_Investigation_06_05"); //M��e� si d�t dohromady s�m, co to znamen�.
};


//*********************************************************************
//	Mann, ich hatte echt schon geglaubt, dass die mich h�ngen! 
//*********************************************************************
instance DIA_Bennet_ThankYou		(C_INFO)
{
	npc		 	 = 	SLD_809_Bennet;
	nr           = 	8;
	condition	 = 	DIA_Bennet_ThankYou_Condition;
	information	 = 	DIA_Bennet_ThankYou_Info;
	permanent	 = 	FALSE;
	Important	 =	TRUE;
};

func int DIA_Bennet_ThankYou_Condition ()
{
	IF (MIS_RescueBennet == LOG_SUCCESS)
	{
		return TRUE;
	};	
};

func void DIA_Bennet_ThankYou_Info ()
{
	if (hero.guild == GIL_SLD)
	{
		other.guild = GIL_DJG;
		Npc_SetTrueGuild (other, GIL_DJG);
	};

	AI_Output	(self ,other,"DIA_Bennet_ThankYou_06_00"); //Chlape, u� jsem si myslel, �e m� v�n� pov�s�!
	AI_Output	(other,self ,"DIA_Bennet_ThankYou_15_01"); //No, nakonec to dob�e dopadlo.
	AI_Output 	(self ,other,"DIA_Bennet_ThankYou_06_02"); //To mi pov�dej. M�l jsi vid�t ksicht toho voj�ka, kdy� m� musel pustit ven!
	AI_Output 	(self ,other,"DIA_Bennet_ThankYou_06_03"); //(sm�je se) Byl tak vystra�enej, �e si skoro nad�lal do kalhot.
	AI_Output 	(self ,other,"DIA_Bennet_ThankYou_06_04"); //Co� mi p�ipom�n�, �e pro tebe n�co m�m.
	AI_Output	(other,self ,"DIA_Bennet_ThankYou_15_05"); //Co mysl�?
	AI_Output 	(self ,other,"DIA_Bennet_ThankYou_06_06"); //(k�en� se) D�re�ek.
	
};

//*********************************************************************
//	Was f�r ein Geschenk?
//*********************************************************************

instance DIA_Bennet_Present		(C_INFO)
{
	npc		 	 = 	SLD_809_Bennet;
	nr           = 	8;
	condition	 = 	DIA_Bennet_Present_Condition;
	information	 = 	DIA_Bennet_Present_Info;
	permanent	 = 	FALSE;
	description	 =	"Jak� d�re�ek?";
};

func int DIA_Bennet_Present_Condition ()
{
	IF (Npc_KnowsInfo (other,DIA_Bennet_ThankYou))
	{
		return TRUE;
	};	
};

func void DIA_Bennet_Present_Info ()
{
	AI_Output	(other,self ,"DIA_Bennet_Present_15_00"); //Jak� d�re�ek?
	
	AI_Output 	(self ,other,"DIA_Bennet_Present_06_01"); //Sly�eli jsme o drac�ch, co by m�li �dajn� bejt v �dol�.
	AI_Output	(other,self ,"DIA_Bennet_Present_15_02"); //Oni tam skute�n� jsou!
	AI_Output 	(self ,other,"DIA_Bennet_Present_06_03"); //Dob�e, j� ti v���m.
	
	if (hero.guild == GIL_DJG)
	{
			
		AI_Output 	(self ,other,"DIA_Bennet_Present_06_04"); //V ka�d�m p��pad� se p�r chlapc� rozhodlo j�t do �dol�.
		AI_Output 	(self ,other,"DIA_Bennet_Present_06_05"); //(zub� se) Maj� v pl�nu to tam trochu uklidit.
		AI_Output	(other,self ,"DIA_Bennet_Present_15_06"); //A co to m� co d�lat se mnou?
		AI_Output 	(self ,other,"DIA_Bennet_Present_06_07"); //(py�n�) Vytvo�il jsem nov� typ brn�n�. Brn�n� drakobijc�!
		AI_Output 	(self ,other,"DIA_Bennet_Present_06_08"); //Je robustn�j�� a leh�� ne� norm�ln� brn�n�.
		AI_Output 	(self ,other,"DIA_Bennet_Present_06_09"); //A proto�e jsi m� zachr�nil, chci, abys dostal prvn� kus. Je to dar!
			
		CreateInvItems (self,ITAR_DJG_L,1);
		B_GiveInvItems (self,other,ITAR_DJG_L,1);
			
		AI_Output 	(self ,other,"DIA_Bennet_Present_06_10"); //Myslel jsem, �e by se ti to mohlo hodit. Bude� pot�ebovat to spr�vn� vybaven�, ne� p�jde� tam dol� do �dol�.
		AI_Output 	(self ,other,"DIA_Bennet_Present_06_11"); //Tak� m� zaj�maj� dra�� �upiny. Opravdov� dra�� �upiny. Slu�n� ti za n� zaplat�m.
		AI_Output	(other,self ,"DIA_Bennet_Present_15_12"); //Kolik dostanu za jednu �upinu?
		B_Say_Gold (self,other,Value_DragonScale); 
	}
	else
	{
		AI_Output 	(self ,other,"DIA_Bennet_Present_06_13"); //Krom� toho jsem si myslel, �e by sis asi necht�l nechat ten dra�� hon uj�t.
		AI_Output	(other,self ,"DIA_Bennet_Present_15_14"); //A?
		AI_Output 	(self ,other,"DIA_Bennet_Present_06_15"); //Tady, vezmi si tenhle amulet. Mysl�m, �e ho bude� pot�ebovat v�c ne� j�.
	
		CreateInvItems (self,ItAm_Hp_01,1); 
		B_GiveInvItems (self,other,ItAm_Hp_01,1);
	};
};


//*********************************************************************
//		DragonScale
//*********************************************************************

//-------------------------------------------------
	var int Bennet_DragonScale_Counter;
	var int Show_DJG_Armor_M;
//-------------------------------------------------

instance DIA_Bennet_DragonScale		(C_INFO)
{
	npc		 	 = 	SLD_809_Bennet;
	nr           = 	8;
	condition	 = 	DIA_Bennet_DragonScale_Condition;
	information	 = 	DIA_Bennet_DragonScale_Info;
	permanent	 = 	TRUE;
	description	 =	"M�m pro tebe p�r dra��ch �upin.";
};

func int DIA_Bennet_DragonScale_Condition ()
{
	IF (Npc_HasItems (other,ItAt_Dragonscale) > 0)
	&& (hero.guild == GIL_DJG)
	{
		return TRUE;
	};	
};

func void DIA_Bennet_DragonScale_Info ()
{	
	AI_Output	(other,self ,"DIA_Bennet_DragonScale_15_00"); //M�m pro tebe p�r dra��ch �upin.
	AI_Output 	(self ,other,"DIA_Bennet_DragonScale_06_01"); //Opravdov� dra�� �upiny!
	AI_Output 	(self ,other,"DIA_Bennet_DragonScale_06_02"); //Tady je tv� zlato!
	
	Bennet_DragonScale_Counter = (Bennet_DragonScale_Counter +(Npc_HasItems (other,ItAT_Dragonscale)));
	
	B_GiveInvItems (self ,other,ItMi_Gold,(Npc_HasItems(other,ItAT_Dragonscale) * Value_DragonScale) ); 
	B_GiveInvItems (other,self ,ItAt_Dragonscale,(Npc_HasItems (other,ItAT_Dragonscale)));
	
	
	if (Bennet_DragonScale_Counter >= 20)
	&& (Show_DJG_Armor_M == FALSE)
	{
		AI_Output 	(self ,other,"DIA_Bennet_DragonScale_06_03"); //Dob�e, to by sta�ilo. Mohl bych ti prodat nov�, vylep�en� brn�n�, pokud bys m�l z�jem.
		
		Show_DJG_Armor_M = TRUE;
	};
};

//*********************************************************************
//		DJG_ARMOR_M
//*********************************************************************

//-----------------------------
var int Bennet_DIA_Bennet_DJG_ARMOR_M_permanent;
//-----------------------------

instance DIA_Bennet_DJG_ARMOR_M		(C_INFO)
{
	npc		 	 = 	SLD_809_Bennet;
	nr           = 	8;
	condition	 = 	DIA_Bennet_DJG_ARMOR_M_Condition;
	information	 = 	DIA_Bennet_DJG_ARMOR_M_Info;
	permanent	 = 	TRUE;
	description	 =	"St�edn� t�k� drakobijeck� zbroj: Ochrana: zbran� 80, ��py 80 (12000 zlat�ch)"; //Wenn �ndern, dann bitte auch in der Info-Instanz. s.u.
};

func int DIA_Bennet_DJG_ARMOR_M_Condition ()
{
	IF (Bennet_DIA_Bennet_DJG_ARMOR_M_permanent == FALSE)
	&& (hero.guild == GIL_DJG)
	&& (Show_DJG_Armor_M == TRUE)
	{
		return TRUE;
	};	
};

func void DIA_Bennet_DJG_ARMOR_M_Info ()
{	
	AI_Output	(other,self ,"DIA_Bennet_DJG_ARMOR_M_15_00"); //Chci si koupit nov� brn�n�.
	
	if (Npc_HasItems (other,itmi_Gold) >= 12000)
	{
		AI_Output 	(self ,other,"DIA_Bennet_DJG_ARMOR_M_06_01"); //Velmi dob�e. Bude se ti l�bit.
		AI_Output	(other,self ,"DIA_Bennet_DJG_ARMOR_M_15_02"); //Za tu cenu by opravdu m�lo.
		AI_Output 	(self ,other,"DIA_Bennet_DJG_ARMOR_M_06_03"); //Zjist�, �e to brn�n� stoj� za ka�dej ten zla��k.
		
		B_GiveInvItems (other,self,ItMi_Gold,12000);
		CreateInvItems (self,ITAR_DJG_M,1);
		B_GiveInvItems (self,other,ITAR_DJG_M,1);
		
		Bennet_DIA_Bennet_DJG_ARMOR_M_permanent = TRUE;
	}
	else
	{
		AI_Output 	(self ,other,"DIA_Bennet_DJG_ARMOR_M_06_04"); //Nem� dost zlata.
	};	
	
};

//*********************************************************************
//		Ich weiss, wie man die R�stung noch mehr verbessern kann.
//*********************************************************************

instance DIA_Bennet_BetterArmor		(C_INFO)
{
	npc		 	 = 	SLD_809_Bennet;
	nr           = 	8;
	condition	 = 	DIA_Bennet_BetterArmor_Condition;
	information	 = 	DIA_Bennet_BetterArmor_Info;
	permanent	 = 	FALSE;
	description	 =	"V�m, jak se m��e brn�n� je�t� v�ce vylep�it.";
};

func int DIA_Bennet_BetterArmor_Condition ()
{
	IF (PlayerGetsFinalDJGArmor == TRUE)
	&& (hero.guild == GIL_DJG)
	{
		return TRUE;
	};	
};

func void DIA_Bennet_BetterArmor_Info ()
{	
	AI_Output	(other,self ,"DIA_Bennet_BetterArmor_15_00"); //V�m, jak brn�n� je�t� v�c vylep�it.
	AI_Output 	(self ,other,"DIA_Bennet_BetterArmor_06_01"); //(usm�v� se) Tak mi to �ekni.
	AI_Output	(other,self ,"DIA_Bennet_BetterArmor_15_02"); //Mohl bys pokr�t dra�� �upiny magickou rudou.
	AI_Output 	(self ,other,"DIA_Bennet_BetterArmor_06_03"); //(sm�je se) Tohle m� u� taky napadlo. A m� pravdu.
	AI_Output 	(self ,other,"DIA_Bennet_BetterArmor_06_04"); //Moje nejnov�j�� brn�n� p�ed�� v�echno, co jsi doposud vid�l. Je te� lehk� a masivn�.
	AI_Output 	(self ,other,"DIA_Bennet_BetterArmor_06_05"); //Je PERFEKTN�.
	AI_Output 	(self ,other,"DIA_Bennet_BetterArmor_06_06"); //M��e� si ho koupit, jestli chce�. Ned�v�m tuhle nab�dku jen tak n�komu a nav�c cena zahrnuje pouze v�robn� n�klady.
};


//*********************************************************************
//		DJG_ARMOR_H
//*********************************************************************

//---------------------------------------------------
var int Bennet_DIA_Bennet_DJG_ARMOR_H_permanent;
//---------------------------------------------------

instance DIA_Bennet_DJG_ARMOR_H		(C_INFO)
{
	npc		 	 = 	SLD_809_Bennet;
	nr           = 	8;
	condition	 = 	DIA_Bennet_DJG_ARMOR_H_Condition;
	information	 = 	DIA_Bennet_DJG_ARMOR_H_Info;
	permanent	 = 	TRUE;
	description	 =	"T�k� drakobijeck� zbroj: Ochrana: zbran� 90, ��py 90. (20000 zlat�ch)"; //Wenn �ndern, dann bitte auch in der Info-Instanz. s.u.
};

func int DIA_Bennet_DJG_ARMOR_H_Condition ()
{
	IF (Bennet_DIA_Bennet_DJG_ARMOR_H_permanent == FALSE)
	&& (hero.guild == GIL_DJG)
	&& (Npc_KnowsInfo (other,DIA_Bennet_BetterArmor))
	{
		return TRUE;
	};	
};

func void DIA_Bennet_DJG_ARMOR_H_Info ()
{	
	AI_Output	(other,self ,"DIA_Bennet_DJG_ARMOR_H_15_00"); //Dej mi to brn�n�.
	
	if (Npc_HasItems (other,itmi_Gold) >= 20000)
	{
		AI_Output 	(self ,other,"DIA_Bennet_DJG_ARMOR_H_06_01"); //Tohle je nejlep�� brn�n�, jak� jsem kdy vyrobil.
		AI_Output 	(self ,other,"DIA_Bennet_DJG_ARMOR_H_06_02"); //Opravdov� skvost.
		
		B_GiveInvItems (other,self,ItMi_Gold,20000);
		CreateInvItems (self,ITAR_DJG_H,1);
		B_GiveInvItems (self,other,ITAR_DJG_H,1);
		
		Bennet_DIA_Bennet_DJG_ARMOR_H_permanent = TRUE;
	}
	else
	{
		AI_Output 	(self ,other,"DIA_Bennet_DJG_ARMOR_H_06_03"); //Nem� dost zlata.
	};	
	
};
//*********************************************************************
//	Kannst du auch Schmuckst�cke reparieren?
//*********************************************************************
instance DIA_Bennet_RepairNecklace		(C_INFO)
{
	npc		 	 = 	SLD_809_Bennet;
	nr           = 	8;
	condition	 = 	DIA_Bennet_RepairNecklace_Condition;
	information	 = 	DIA_Bennet_RepairNecklace_Info;
	permanent	 = 	FALSE;
	description	 = 	"Um� opravit i klenoty?";
};

func int DIA_Bennet_RepairNecklace_Condition ()
{
	if 	(MIS_Bennet_InnosEyeRepairedSetting   != LOG_SUCCESS)
	&&	((Npc_HasItems (other,ItMi_InnosEye_Broken_MIS)) 
	||   (MIS_SCKnowsInnosEyeIsBroken  == TRUE)) 
  	{
  		return TRUE;
  	};
};

func void DIA_Bennet_RepairNecklace_Info ()
{
	AI_Output			(other, self, "DIA_Bennet_RepairNecklace_15_00"); //Um� opravit i klenoty?
	AI_Output			(self, other, "DIA_Bennet_RepairNecklace_06_01"); //Z�le�� na tom jak�. Nejd��v mi uka�, co m� na mysli.
	
	if (MIS_RescueBennet != LOG_SUCCESS)
	{
		AI_Output (self ,other,"DIA_Bennet_RepairNecklace_06_02"); //Taky se odsud mus�m nejd��v dostat.
		AI_Output (self ,other,"DIA_Bennet_RepairNecklace_06_03"); //DO t� doby ti tu v�c z�ejm� neoprav�m.
	};	
	
	MIS_SCKnowsInnosEyeIsBroken  = TRUE; 	
};

//*********************************************************************
//		Hier wird das Amulett repariert
//*********************************************************************

//*********************************************************************
//	Kannst du mir dieses Amulett reparieren?
//*********************************************************************
instance DIA_Bennet_ShowInnosEye		(C_INFO)
{
	npc		 	 = 	SLD_809_Bennet;
	nr           = 	8;
	condition	 = 	DIA_Bennet_ShowInnosEye_Condition;
	information	 = 	DIA_Bennet_ShowInnosEye_Info;
	permanent	 = 	FALSE;
	description	 = 	"M��e� se pod�vat na tenhle amulet?";
};

func int DIA_Bennet_ShowInnosEye_Condition ()
{
	if (Npc_HasItems (other,ItMi_InnosEye_Broken_MIS))
	&& (MIS_Bennet_InnosEyeRepairedSetting   != LOG_SUCCESS)
 	{
    	return TRUE;
  	};

};

func void DIA_Bennet_ShowInnosEye_Info ()
{
	AI_Output			(other, self, "DIA_Bennet_ShowInnosEye_15_00"); //M��e� se pod�vat na tenhle amulet?
	AI_Output			(self, other, "DIA_Bennet_ShowInnosEye_06_01"); //Jasn�, uka� mi ho.
	AI_Output			(self, other, "DIA_Bennet_ShowInnosEye_06_02"); //Hmm, to je skute�n� n�dhern� pr�ce. Oprava bude z�hul. Ale mysl�m si, �e jsem schopnej to opravit.
	AI_Output			(other, self, "DIA_Bennet_ShowInnosEye_15_03"); //Jak dlouho ti to potrv�?
	if (MIS_REscueBennet != LOG_SUCCESS)
	{
		AI_Output (self ,other,"DIA_Bennet_ShowInnosEye_06_04"); //No, te� jsem se zaseknul tady. Nebo tu snad vid� n�kde d�lnu?
		AI_Output (self ,other,"DIA_Bennet_ShowInnosEye_06_05"); //Kdybych byl ve sv� kov�rn�, byl bych schopnej to v�echno ud�lat za jeden den. Ale samoz�ejm� se mus�m nejd��v dostat ven.
	}
	else
	{
	AI_Output			(self, other, "DIA_Bennet_ShowInnosEye_06_06"); //Pokud mi ho tu nech�, bude hotovej do doby, ne� se sem z�tra vr�t�.
	AI_Output			(self, other, "DIA_Bennet_ShowInnosEye_06_07"); //A dokonce ti to ani nebudu ��tovat. V�dy� jsi m� dostal ven z lochu.
	};
	
	B_LogEntry (TOPIC_INNOSEYE, "Bennet je ten prav� kov��, kter� mi oprav� ten amulet.");

	MIS_SCKnowsInnosEyeIsBroken  = TRUE;
};

//*********************************************************************
//	Kannst du mir dieses Amulett reparieren?
//*********************************************************************
instance DIA_Bennet_GiveInnosEye		(C_INFO)
{
	npc		 	 = 	SLD_809_Bennet;
	nr           = 	8;
	condition	 = 	DIA_Bennet_GiveInnosEye_Condition;
	information	 = 	DIA_Bennet_GiveInnosEye_Info;
	permanent	 = 	FALSE;
	description	 = 	"Tady je ten amulet, pros�m oprav mi ho.";
};

func int DIA_Bennet_GiveInnosEye_Condition ()
{
	IF (Npc_HasItems (other,ItMi_InnosEye_Broken_Mis)	>=1)
	&& (MIS_SCKnowsInnosEyeIsBroken  == TRUE)
	&& (MIS_REscueBennet == LOG_SUCCESS)
	&& (MIS_Bennet_InnosEyeRepairedSetting   != LOG_SUCCESS)
	{
		return TRUE;
	};	                                                                             
};

func void DIA_Bennet_GiveInnosEye_Info ()
{
	AI_Output			(other, self, "DIA_Bennet_GiveInnosEye_15_00"); //Tady je ten amulet, oprav mi ho, pros�m.
	AI_Output			(self, other, "DIA_Bennet_GiveInnosEye_06_01"); //Dob�e. Budu to m�t opraven� do z�t�ka.
	AI_Output			(self, other, "DIA_Bennet_GiveInnosEye_06_02"); //Tak si pak pro n�j p�ij�.
	
	Npc_RemoveInvItems	(other,	ItMi_InnosEye_Broken_Mis,1);
	AI_PrintScreen (Print_InnoseyeGiven, -1, YPOS_ItemGiven, FONT_ScreenSmall, 2);
	
	Bennet_RepairDay = Wld_GetDay ();	
};



///////////////////////////////////////////////////////////////////////
//	Kannst du mir dieses Amulett reparieren?
///////////////////////////////////////////////////////////////////////
instance DIA_Bennet_GetInnosEye		(C_INFO)
{
	npc		 	 = 	SLD_809_Bennet;
	nr           = 	8;
	condition	 = 	DIA_Bennet_GetInnosEye_Condition;
	information	 = 	DIA_Bennet_GetInnosEye_Info;
	permanent	 = 	TRUE;
	description	 = 	"Je amulet hotov�?";
};

func int DIA_Bennet_GetInnosEye_Condition ()
{
	IF (Npc_KnowsInfo (other,DIA_Bennet_GiveInnosEye)
	&& (MIS_Bennet_InnosEyeRepairedSetting   != LOG_SUCCESS)) 
	{
		return TRUE;
	};	
};

func void DIA_Bennet_GetInnosEye_Info ()
{
	AI_Output			(other, self, "DIA_Bennet_GetInnosEye_15_00"); //Je amulet hotov�?
	
	if (Bennet_RepairDay < Wld_GetDay())
	{
		AI_Output			(self, other, "DIA_Bennet_GetInnosEye_06_01"); //Ano, tady je.
	
		TEXT_Innoseye_Setting = TEXT_Innoseye_Setting_Repaired;
		CreateInvItems (other,ItMi_InnosEye_Broken_Mis,1);
		AI_PrintScreen (Print_InnoseyeGet, -1, YPOS_ItemGiven, FONT_ScreenSmall, 2);
	
		AI_Output			(self, other, "DIA_Bennet_GetInnosEye_06_02"); //Musel jsem tam zasadit nov� k�men.
		AI_Output			(self, other, "DIA_Bennet_GetInnosEye_06_03"); //Pracoval jsem na n�m celou noc. Koukni na to,  vypad� jako nov�.
		
		B_LogEntry (TOPIC_INNOSEYE, "Amulet je op�t cel�, Bennet odvedl skv�lou pr�ci.");
		
		MIS_Bennet_InnosEyeRepairedSetting   = LOG_SUCCESS;
		
		B_GivePlayerXP (XP_InnosEyeIsRepaired);
	}
	else
	{	//Hack Mattes
		B_SayBennetLATER();
		//AI_Output			(self, other, "DIA_Bennet_GetInnosEye_06_04"); //Nein, noch nicht. Komm sp�ter wieder.
		AI_Output			(self, other, "DIA_Bennet_GetInnosEye_06_05"); //Kdy� m� bude� zdr�ovat, bude to trvat d�le.
		
		AI_StopProcessInfos (self);
	};	 
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

INSTANCE DIA_Bennet_KAP4_EXIT(C_INFO)
{
	npc			= SLD_809_Bennet;
	nr			= 999;
	condition	= DIA_Bennet_KAP4_EXIT_Condition;
	information	= DIA_Bennet_KAP4_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Bennet_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Bennet_KAP4_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Dracheneier
///////////////////////////////////////////////////////////////////////
instance DIA_Bennet_DRACHENEIER		(C_INFO)
{
	npc		 = 	SLD_809_Bennet;
	nr		 = 	5;
	condition	 = 	DIA_Bennet_DRACHENEIER_Condition;
	information	 = 	DIA_Bennet_DRACHENEIER_Info;
	permanent	 = 	TRUE;

	description	 = 	"M��e� n�co ud�lat s dra��mi vejci?";
};

func int DIA_Bennet_DRACHENEIER_Condition ()
{
	if (Kapitel >= 4)
	&& (BennetsDragonEggOffer == 0)
	&& (Npc_HasItems (other,ItAt_DragonEgg_MIS) >= 1)
	&& (hero.guild == GIL_DJG)
		{
				return TRUE;
		};
};
var int BennetsDragonEggOffer;
var int DRACHENEIER_angebotenXP_OneTime;
func void DIA_Bennet_DRACHENEIER_Info ()
{
	AI_Output			(other, self, "DIA_Bennet_DRACHENEIER_15_00"); //D� se n�co ud�lat s dra��mi vejci?
	if (DRACHENEIER_angebotenXP_OneTime == FALSE)
	{
	AI_Output			(self, other, "DIA_Bennet_DRACHENEIER_06_01"); //Dra��mi vejci? Jak jsi k nim krucin�l p�i�el?
	AI_Output			(other, self, "DIA_Bennet_DRACHENEIER_15_02"); //Vzal jsem je je�t�r�m.
	AI_Output			(self, other, "DIA_Bennet_DRACHENEIER_06_03"); //Uka� mi to.
	};

	Npc_RemoveInvItems	(other,	ItAt_DragonEgg_MIS,	1);
	AI_PrintScreen (PRINT_ItemGegeben, -1, YPOS_ItemGiven, FONT_ScreenSmall, 2);	// "1 Gegenstand gegeben"	

	if (DRACHENEIER_angebotenXP_OneTime == FALSE)
	{
	AI_Output			(self, other, "DIA_Bennet_DRACHENEIER_06_04"); //Mmh. Velmi �ikovn� materi�l. Ide�ln� k dokon�en� brn�n�. Teda pokud se mi je poda�� rozlousknout.
	AI_Output			(other, self, "DIA_Bennet_DRACHENEIER_15_05"); //Tak�e co bude? Chce� je?
	AI_Output			(self, other, "DIA_Bennet_DRACHENEIER_06_06"); //Jasn�! Dej je sem.
	}
	else
	{
	AI_Output			(self, other, "DIA_Bennet_DRACHENEIER_06_07"); //Jak dlouho tu bude� s tou v�c� m�vat? Chce�, abych to koupil, nebo ne?
	};

	AI_Output			(self, other, "DIA_Bennet_DRACHENEIER_06_08"); //Zaplat�m ti, hmm, �ekn�me, 300 zlat�ch za ka�d� dra�� vejce, kter� mi p�inese�.

	Info_ClearChoices	(DIA_Bennet_DRACHENEIER);
	Info_AddChoice	(DIA_Bennet_DRACHENEIER, "Tak si svoje zlato nech. Mysl�m, �e si to nech�m.", DIA_Bennet_DRACHENEIER_nein );
	Info_AddChoice	(DIA_Bennet_DRACHENEIER, "Tohle jsou dra�� vejce, ne slepi��...", DIA_Bennet_DRACHENEIER_mehr );
	Info_AddChoice	(DIA_Bennet_DRACHENEIER, "Dohodnuto.", DIA_Bennet_DRACHENEIER_ok );

	IF (DRACHENEIER_angebotenXP_OneTime == FALSE)
	{
	B_LogEntry (TOPIC_DRACHENEIER,"Bennet je ochoten mi dob�e zaplatit za v�echna dra�� vejce, kter� mu p�inesu."); 
	B_GivePlayerXP (XP_DJG_BringDragonEgg);
	DRACHENEIER_angebotenXP_OneTime = TRUE;
	};
};
func void DIA_Bennet_DRACHENEIER_ok ()
{
	AI_Output			(other, self, "DIA_Bennet_DRACHENEIER_ok_15_00"); //Dohodnuto.
	AI_Output			(self, other, "DIA_Bennet_DRACHENEIER_ok_06_01"); //Dob�e.
	AI_Output			(self, other, "DIA_Bennet_DRACHENEIER_ok_06_02"); //Kdy� je�t� na n�co takov�ho naraz�, ur�it� mi to p�ines.

	if (BennetsDragonEggOffer != 350)
	{
		BennetsDragonEggOffer = 300;	
	};

	CreateInvItems (self, ItMi_Gold, BennetsDragonEggOffer);									
	B_GiveInvItems (self, other, ItMi_Gold,	BennetsDragonEggOffer);

	AI_Output			(self, other, "DIA_Bennet_DRACHENEIER_ok_06_03"); //Ehm. ��k�, �es je vzal je�t�r�m?
	AI_Output			(other, self, "DIA_Bennet_DRACHENEIER_ok_15_04"); //Spr�vn�.
	AI_Output			(self, other, "DIA_Bennet_DRACHENEIER_ok_06_05"); //Z toho, co jsem sly�el, tak v�t�ina je�t�r� bydl� v jeskyn�ch.
	AI_Output			(self, other, "DIA_Bennet_DRACHENEIER_ok_06_06"); //Nep�ekvapilo by m�, kdybys na�el v�c t�chhle v�c� v jeskyn�ch tady v okol�.
	B_LogEntry (TOPIC_DRACHENEIER,"Bennet si mysl�, �e bych se po vejc�ch m�l pod�vat v khorinidsk�ch jeskyn�ch, kde by m�li je�t��i p�eb�vat."); 
	
	AI_Output (self, other, "DIA_Bennet_DRACHENEIER_ok_06_07"); //Tady. Vem si tuhle mapu. Ta ti pom��e naj�t ty jeskyn�.
	CreateInvItems (self, ItWr_Map_Caves_MIS, 1);									
	B_GiveInvItems (self, other, ItWr_Map_Caves_MIS,1);
	B_LogEntry (TOPIC_DRACHENEIER,"Dal mi mapu jeskyn�, kter� by mi m�la pomoci."); 
	
	if (1 == 2) //MH: Besser Karte direkt (war sowieso so - wegen Bug)
	{
		AI_Output			(self, other, "DIA_Bennet_DRACHENEIER_ok_06_08"); //Nejd��v ale mus� z�skat mapu jeskyn� od kartografa ve m�st�. Byla by to �koda, kdybys je nemohl naj�t v�echny.
		B_LogEntry (TOPIC_DRACHENEIER,"M�l bych si u m�stn�ho kartografa obstarat mapu jeskyn�, aby mi ��dn� vejce neuniklo."); 
	};
	
	Info_ClearChoices	(DIA_Bennet_DRACHENEIER);
};

func void DIA_Bennet_DRACHENEIER_mehr ()
{
	AI_Output			(other, self, "DIA_Bennet_DRACHENEIER_mehr_15_00"); //Tohle jsou dra�� vejce, ne bezcenn� slepi�� vaj��ka.
	AI_Output			(self, other, "DIA_Bennet_DRACHENEIER_mehr_06_01"); //(podr�d�n�) Dob�e. Tak 350. Ale v�c ti za n� u� d�t nem��u - pak by se mi to nevyplatilo.
	BennetsDragonEggOffer =	350;
};

func void DIA_Bennet_DRACHENEIER_nein ()
{
	AI_Output			(other, self, "DIA_Bennet_DRACHENEIER_nein_15_00"); //Tak si nech svoje zlato. Mysl�m, �e si to nech�m.
	AI_Output			(self, other, "DIA_Bennet_DRACHENEIER_nein_06_01"); //Dej mi v�d�t, a� si to rozmysl�.

	CreateInvItems (other, ItAt_DragonEgg_MIS, 1);									
	AI_PrintScreen	(PRINT_ItemErhalten, -1, YPOS_ItemTaken, FONT_ScreenSmall, 2);	// "1 Gegenstand erhalten"

	BennetsDragonEggOffer = 0;
	Info_ClearChoices	(DIA_Bennet_DRACHENEIER);
};

///////////////////////////////////////////////////////////////////////
//	Info EierBringen
///////////////////////////////////////////////////////////////////////
instance DIA_Bennet_EierBringen		(C_INFO)
{
	npc		 = 	SLD_809_Bennet;
	nr		 = 	5;
	condition	 = 	DIA_Bennet_EierBringen_Condition;
	information	 = 	DIA_Bennet_EierBringen_Info;
	permanent	 = 	TRUE;

	description	 = 	"Zaj�maj� t� je�t� dal�� dra�� vejce?";
};

func int DIA_Bennet_EierBringen_Condition ()
{
	if (BennetsDragonEggOffer > 0)
	&& (Kapitel >= 4)
	&& (Npc_HasItems (other,ItAt_DragonEgg_MIS) >= 1)
	&& (hero.guild == GIL_DJG)
		{
				return TRUE;
		};
};

var int DragonEggCounter;

func void DIA_Bennet_EierBringen_Info ()
{
	AI_Output			(other, self, "DIA_Bennet_EierBringen_15_00"); //Zaj�maj� t� je�t� dal�� dra�� vejce?
	AI_Output			(self, other, "DIA_Bennet_EierBringen_06_01"); //Jist�!

	var int DragonEggCount;
	var int XP_DJG_BringDragonEggs;
	var int DragonEggGeld;
	var string concatText;
	
	DragonEggCount = Npc_HasItems(other, ItAt_DragonEgg_MIS);


	if (DragonEggCount == 1)
		{
			AI_Output		(other, self, "DIA_Bennet_EierBringen_15_02"); //Tady. M�m dal��.
			B_GivePlayerXP (XP_DJG_BringDragonEgg);
			Npc_RemoveInvItems	(other,	ItAt_DragonEgg_MIS,	1);
			AI_PrintScreen (PRINT_ItemGegeben, -1, YPOS_ItemGiven, FONT_ScreenSmall, 2);	// "1 Gegenstand gegeben"	
			DragonEggCounter = DragonEggCounter + 1;
		}
		else
		{
			AI_Output		(other, self, "DIA_Bennet_EierBringen_15_03"); //M�m tady je�t� n�jak�.

			Npc_RemoveInvItems	(other,	ItAt_DragonEgg_MIS,	DragonEggCount);
			concatText = ConcatStrings(IntToString(DragonEggCount), PRINT_ItemsGegeben);		// "x Gegenst�nde gegeben"
			AI_PrintScreen (concatText, -1, YPOS_ItemGiven, FONT_ScreenSmall, 2);

			XP_DJG_BringDragonEggs = (DragonEggCount * XP_DJG_BringDragonEgg);
			DragonEggCounter = (DragonEggCounter + DragonEggCount); 

			B_GivePlayerXP (XP_DJG_BringDragonEggs);
		};

	if (DragonEggCounter <= 7)
	{
		AI_Output			(self, other, "DIA_Bennet_EierBringen_06_04"); //Skv�le. Dej to sem. D�val ses po nich v�ude? Jist� mus� n�kde b�t je�t� n�jak�.
	}
	else if	(DragonEggCounter <= 11)
	{
		AI_Output			(self, other, "DIA_Bennet_EierBringen_06_05"); //Kde tyhle v�ci�ky v�bec po��d nach�z�? Vsad�m se, �e u� jich tady moc nebude.
	}
	else
	{
		AI_Output			(self, other, "DIA_Bennet_EierBringen_06_06"); //Nemysl�m si, �e je�t� n�co najde�. A j� u� toho m�m tolik, �e ani nev�m, co s t�m budu d�lat.
		TOPIC_END_DRACHENEIER = TRUE;
	};

	AI_Output			(self, other, "DIA_Bennet_EierBringen_06_07"); //Jo, spr�vn�. Tady m� pen�ze.

	DragonEggGeld	= (DragonEggCount * BennetsDragonEggOffer);

	CreateInvItems (self, ItMi_Gold, DragonEggGeld); 
	B_GiveInvItems (self, other, ItMi_Gold, DragonEggGeld);
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

INSTANCE DIA_Bennet_KAP5_EXIT(C_INFO)
{
	npc			= SLD_809_Bennet;
	nr			= 999;
	condition	= DIA_Bennet_KAP5_EXIT_Condition;
	information	= DIA_Bennet_KAP5_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Bennet_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Bennet_KAP5_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Ich weiss wo der Feind ist.
///////////////////////////////////////////////////////////////////////
instance DIA_Bennet_KnowWhereEnemy		(C_INFO)
{
	npc			 = 	SLD_809_Bennet;
	nr			 = 	55;
	condition	 = 	DIA_Bennet_KnowWhereEnemy_Condition;
	information	 = 	DIA_Bennet_KnowWhereEnemy_Info;
	PERMANENT 	 =  TRUE;
	description	 = 	"Pot�ebuju se dostat na ostrov. Mohl bych vz�t kov��e.";
};
func int DIA_Bennet_KnowWhereEnemy_Condition ()
{	
	if (MIS_SCKnowsWayToIrdorath == TRUE)
	&& (Bennet_IsOnBoard == FALSE) 
	{
		return TRUE;
	};
};
func void DIA_Bennet_KnowWhereEnemy_Info ()
{
	AI_Output			(other, self, "DIA_Bennet_KnowWhereEnemy_15_00"); //Pot�ebuju se dostat na ostrov. Kov�� by se mi mohl hodit.
	AI_Output			(self, other, "DIA_Bennet_KnowWhereEnemy_06_01"); //A t�m jako mysl� m�.
	AI_Output			(other, self, "DIA_Bennet_KnowWhereEnemy_15_02"); //Jo. Co na to ��k�? ��kals p�ece, �e bys odsud r�d vypadnul.
	AI_Output			(self, other, "DIA_Bennet_KnowWhereEnemy_06_03"); //Je to lep�� ne� Onarova farma. Chlap�e, mysl�m, �e ani v pekle to nebude hor��. Po��tej se mnou.
	
	Log_CreateTopic (TOPIC_Crew, LOG_MISSION);   
	Log_SetTopicStatus(TOPIC_Crew, LOG_RUNNING); 
	B_LogEntry (TOPIC_Crew,"Bennet by mohl odej�t klidn� hned te�. Jeho kov��sk�mu um�n� se hned tak n�kdo nevyrovn� a j� se od n�j mohu leccos p�iu�it.");
		
	if (crewmember_count >= Max_Crew)
	{
		AI_Output			(other,self , "DIA_Bennet_KnowWhereEnemy_15_04"); //Moje pos�dka je v tuhle chv�li kompletn�.
		AI_Output			(self, other, "DIA_Bennet_KnowWhereEnemy_06_05"); //Pak tedy jednoho z nich po�li zase pry�.
	}
	else 
	{
		Info_ClearChoices (DIA_Bennet_KnowWhereEnemy);
		Info_AddChoice (DIA_Bennet_KnowWhereEnemy,"D�m ti v�as v�d�t, a� t� budu pot�ebovat. ",DIA_Bennet_KnowWhereEnemy_No);
		Info_AddChoice (DIA_Bennet_KnowWhereEnemy,"Tak bu� tedy m�m kov��em. Sejdeme se v p��stavu!",DIA_Bennet_KnowWhereEnemy_Yes);
	};
};

FUNC VOID DIA_Bennet_KnowWhereEnemy_Yes ()
{
	AI_Output (other,self ,"DIA_Bennet_KnowWhereEnemy_Yes_15_00"); //Tak tedy bu� m�m kov��em. Uvid�me se v p��stavu.
	AI_Output (self ,other,"DIA_Bennet_KnowWhereEnemy_Yes_06_01"); //Dob�e. Uvid�me se pozd�ji.
	
	B_GivePlayerXP (XP_Crewmember_Success); 
	
	
	self.flags 		 = NPC_FLAG_IMMORTAL;
	Bennet_IsOnBoard	 = LOG_SUCCESS;
	crewmember_Count = (Crewmember_Count +1);
	
	if (MIS_ReadyforChapter6 == TRUE)
		{
			Npc_ExchangeRoutine (self,"SHIP"); 
		}
		else
		{
			Npc_ExchangeRoutine (self,"WAITFORSHIP"); 
		};

	Info_ClearChoices (DIA_Bennet_KnowWhereEnemy);
};

FUNC VOID DIA_Bennet_KnowWhereEnemy_No ()
{
	AI_Output (other,self ,"DIA_Bennet_KnowWhereEnemy_No_15_00"); //D�m ti v�as v�d�t, a� t� budu pot�ebovat.
	AI_Output (self ,other,"DIA_Bennet_KnowWhereEnemy_No_06_01"); //Fajn. Budu tady.

	Bennet_IsOnBoard	 = LOG_OBSOLETE;
	Info_ClearChoices (DIA_Bennet_KnowWhereEnemy);
};

///////////////////////////////////////////////////////////////////////
//	I kann dich doch nicht gebrauchen!
///////////////////////////////////////////////////////////////////////
instance DIA_Bennet_LeaveMyShip		(C_INFO)
{
	npc			 = 	SLD_809_Bennet;
	nr			 = 	55;
	condition	 = 	DIA_Bennet_LeaveMyShip_Condition;
	information	 = 	DIA_Bennet_LeaveMyShip_Info;
	PERMANENT 	 =  TRUE;
	description	 = 	"Budu si muset naj�t jin�ho kov��e.";
};
func int DIA_Bennet_LeaveMyShip_Condition ()
{	
	if (Bennet_IsOnBOard == LOG_SUCCESS)
	&& (MIS_ReadyforChapter6 == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Bennet_LeaveMyShip_Info ()
{
	AI_Output			(other, self, "DIA_Bennet_LeaveMyShip_15_00"); //Budu si muset naj�t jin�ho kov��e.
	AI_Output			(self, other, "DIA_Bennet_LeaveMyShip_06_01"); //Jednou je to takhle, a za chv�li zase jinak. Dej si to v hlav� dohromady, jo? A a� bude� v�d�t, co vlastn� chce�, dej mi v�d�t.
	
	Bennet_IsOnBoard	 = LOG_OBSOLETE;				//Log_Obsolete ->der Sc kann ihn wiederholen, Log_Failed ->hat die Schnauze voll, kommt nicht mehr mit! 
	crewmember_Count = (Crewmember_Count -1);
	
	Npc_ExchangeRoutine (self,"Za��t"); 
};

///////////////////////////////////////////////////////////////////////
//	Ich habs mir �berlegt!
///////////////////////////////////////////////////////////////////////
instance DIA_Bennet_StillNeedYou		(C_INFO)
{
	npc			 = 	SLD_809_Bennet;
	nr			 = 	55;
	condition	 = 	DIA_Bennet_StillNeedYou_Condition;
	information	 = 	DIA_Bennet_StillNeedYou_Info;
	PERMANENT 	 =  TRUE;
	description	 = 	"Poj� zp�tky. Nem��u naj�t jin�ho kov��e.";
};

func int DIA_Bennet_StillNeedYou_Condition ()
{	
	if ((Bennet_IsOnBOard == LOG_OBSOLETE)	
	|| (Bennet_IsOnBOard == LOG_FAILED))
	&& (crewmember_count < Max_Crew)
	{
		return TRUE;
	};
};

func void DIA_Bennet_StillNeedYou_Info ()
{
	AI_Output	(other, self, "DIA_Bennet_StillNeedYou_15_00"); //Poj� zp�tky. Nem��u naj�t jin�ho kov��e.
	AI_Output	(self, other, "DIA_Bennet_StillNeedYou_06_01"); //(na�tvan�) Spr�vn�! Jsem tu jenom j�, tak nikoho nehledej. Uvid�me se pozd�ji v doc�ch.
		
	self.flags 		 = NPC_FLAG_IMMORTAL;
	Bennet_IsOnBoard	 = LOG_SUCCESS;
	crewmember_Count = (Crewmember_Count +1);
	
	AI_StopProcessInfos (self);

		if (MIS_ReadyforChapter6 == TRUE)
			{
				Npc_ExchangeRoutine (self,"SHIP"); 
			}
			else
			{
				Npc_ExchangeRoutine (self,"WAITFORSHIP"); 
			};
};


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Bennet_PICKPOCKET (C_INFO)
{
	npc			= SLD_809_Bennet;
	nr			= 900;
	condition	= DIA_Bennet_PICKPOCKET_Condition;
	information	= DIA_Bennet_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Bennet_PICKPOCKET_Condition()
{
	C_Beklauen (35, 45);
};
 
FUNC VOID DIA_Bennet_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Bennet_PICKPOCKET);
	Info_AddChoice		(DIA_Bennet_PICKPOCKET, DIALOG_BACK 		,DIA_Bennet_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Bennet_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Bennet_PICKPOCKET_DoIt);
};

func void DIA_Bennet_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Bennet_PICKPOCKET);
};
	
func void DIA_Bennet_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Bennet_PICKPOCKET);
};



























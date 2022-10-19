FUNC VOID B_DaronSegen ()
{
	Daron_Segen = TRUE;

	var string concatText;
	
	var int Bonus_1;
	var int Bonus_2;
	var int Bonus_3;

	if (Daron_Spende < 100)
	{
		if other.attribute[ATR_HITPOINTS] <  other.attribute[ATR_HITPOINTS_MAX]
		{
			other.attribute [ATR_HITPOINTS] = other.attribute[ATR_HITPOINTS_MAX];
			PrintScreen (PRINT_FullyHealed, - 1, - 1, FONT_Screen, 2);   
		};
	}	 	
	else if (Daron_Spende < 250)
	&&		(Bonus_1 == FALSE)
	{
		B_RaiseAttribute (other, ATR_MANA_MAX, 2);
		
		other.attribute[ATR_MANA] =  other.attribute[ATR_MANA_MAX];
				
		Bonus_1 = TRUE;
	}
	else if (Daron_Spende < 500)
	&&		(Bonus_2 == FALSE)
	{
		B_GivePlayerXP (XP_Ambient);
		Bonus_2 = TRUE;
	}
	else if (Daron_Spende >= 750) 	
	&&		(Daron_Spende < 1000) 	
	&& 		(Bonus_3 == FALSE)
	{
		other.lp = (other.lp + 1);
		
		concatText = ConcatStrings(PRINT_LearnLP, IntToString(1));
		PrintScreen	(concatText, -1, -1, FONT_SCREEN, 2);
		Bonus_3 = TRUE;
	}
	else 
	{
		other.attribute[ATR_HITPOINTS] =  other.attribute[ATR_HITPOINTS_MAX];
		other.attribute[ATR_MANA] =  other.attribute[ATR_MANA_MAX];

		other.attribute[ATR_HITPOINTS_MAX] = (other.attribute[ATR_HITPOINTS_MAX] + 5);
		
		concatText = ConcatStrings(PRINT_Learnhitpoints_MAX, IntToString(5));
		PrintScreen	(concatText, -1, -1, FONT_Screen, 2);
	};
};
// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Daron_EXIT(C_INFO)
{
	npc			= KDF_511_Daron;
	nr			= 999;
	condition	= DIA_Daron_EXIT_Condition;
	information	= DIA_Daron_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Daron_EXIT_Condition()
{
	
	return TRUE;
};
FUNC VOID DIA_Daron_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};
// ************************************************************
// 			  				  Hallo 
// ************************************************************
INSTANCE DIA_Daron_Hallo(C_INFO)
{
	npc			= KDF_511_Daron;
	nr			= 2;
	condition	= DIA_Daron_Hallo_Condition;
	information	= DIA_Daron_Hallo_Info;
	permanent	= FALSE;
	important 	= TRUE;
};                       
FUNC INT DIA_Daron_Hallo_Condition()
{	
	if Npc_IsInState (self, ZS_Talk)
	&& (hero.guild != GIL_KDF)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Daron_Hallo_Info()
{	
	AI_Output (self, other,"DIA_Daron_Hallo_10_00");//Co pro tebe mohu ud�lat? Hled� duchovn� �t�chu?
	AI_Output (self, other,"DIA_Daron_Hallo_10_01");//Chce� odeslat modlitbu na�emu P�nu Innosovi, nebo darovat kostelu n�jak� pen�ze?
};

// ************************************************************
// 			  	Oberes Viertel - Paladine 
// ************************************************************
INSTANCE DIA_Daron_Paladine(C_INFO)
{
	npc			= KDF_511_Daron;
	nr			= 2;
	condition	= DIA_Daron_Paladine_Condition;
	information	= DIA_Daron_Paladine_Info;
	permanent	= FALSE;
	description = "Pot�ebuji mluvit s paladiny...";
};                       
FUNC INT DIA_Daron_Paladine_Condition()
{	
	if (other.guild != GIL_KDF)
	&& (Kapitel < 2)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Daron_Paladine_Info()
{	
	AI_Output (other, self,"DIA_Daron_Paladine_15_00");//Pot�eboval bych si promluvit s paladiny. M��e� m� k nim n�jak dostat?
	AI_Output (self, other,"DIA_Daron_Paladine_10_01");//No, bude� pot�ebovat povolen� ke vstupu do horn� ��sti m�sta. To v�ak maj� jen ob�an� m�sta a m�stsk� str�.
	AI_Output (self, other,"DIA_Daron_Paladine_10_02");//A pochopiteln� my, ohniv� m�gov�.
	AI_Output (other, self,"DIA_Daron_Paladine_15_03");//Jak bych se mohl st�t ohniv�m m�gem?
	AI_Output (self, other,"DIA_Daron_Paladine_10_04");//Mus� se p�ipojit k na�emu ��du jako novic. A� bude� slou�it ur�it� �as, mo�n� bude� p�ijat do �ad m�g�.
	AI_Output (self, other,"DIA_Daron_Paladine_10_05");//Tahle cesta je ov�em dlouh� a pln� pr�ce a studia.
};

// ************************************************************
// 			  				About Segen 
// ************************************************************
INSTANCE DIA_Daron_AboutSegen (C_INFO)
{
	npc			= KDF_511_Daron;
	nr			= 2;
	condition	= DIA_Daron_AboutSegen_Condition;
	information	= DIA_Daron_AboutSegen_Info;
	permanent	= FALSE;
	description = "P�i�el jsem si pro tv� po�ehn�n�!";
};                       
FUNC INT DIA_Daron_AboutSegen_Condition()
{	
	if (MIS_Thorben_GetBlessings == LOG_RUNNING)
	&& (Player_IsApprentice == APP_NONE)
	&& (hero.guild != GIL_KDF)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Daron_AboutSegen_Info()
{	
	AI_Output (other, self,"DIA_Daron_AboutSegen_15_00"); //P�i�el jsem si pro tv� po�ehn�n�!
	AI_Output (self, other,"DIA_Daron_AboutSegen_10_01"); //To je dob�e, to je dob�e - v tom p��pad� bys jist� cht�l p�isp�t n�jak�m t�m zla��kem ve prosp�ch svat� c�rkve Innosovy, �e?
	AI_Output (other, self,"DIA_Daron_AboutSegen_15_02"); //No, ve skute�nosti bych r�d dostal tv� po�ehn�n�, abych se mohl zapsat jako u�edn�k v doln� ��sti m�sta.
	if (Daron_Segen == TRUE)
	{
		AI_Output (self, other,"DIA_Daron_AboutSegen_10_03"); //Ale j� u� ti sv� po�ehn�n� dal, m�j synu.
		AI_Output (self, other,"DIA_Daron_AboutSegen_10_04"); //Nech� t� Innos doprov�z�, m�j synu!
	}
	else
	{
		AI_Output (self, other,"DIA_Daron_AboutSegen_10_05"); //Ale m�j synu! Bez p�im��en�ho daru c�rkvi ti po�ehn�n� d�t nemohu.
		AI_Output (self, other,"DIA_Daron_AboutSegen_10_06"); //Jak jinak bych si mohl b�t jist tv�mi dobr�mi �mysly?
	};
};

// ************************************************************
// 			  		Spenden
// ************************************************************
INSTANCE DIA_Daron_Spenden(C_INFO)
{
	npc			= KDF_511_Daron;
	nr			= 3;
	condition	= DIA_Daron_Spenden_Condition;
	information	= DIA_Daron_Spenden_Info;
	permanent	= FALSE;
	description	= "Tak�e jak vysok� dar se tady v�t�inou d�v�?";
};                       
FUNC INT DIA_Daron_Spenden_Condition()
{	if (hero.guild != GIL_KDF)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Daron_Spenden_Info()
{	
	AI_Output (other, self,"DIA_Daron_Spenden_15_00");//Tak�e jak vysok� dar se tady v�t�inou d�v�?
	AI_Output (self, other,"DIA_Daron_Spenden_10_01");//No, to z�le�� na tom, jak velk� majetek m�. Nech m� se pod�vat, kolik u sebe m�.
	AI_Output (self, other,"DIA_Daron_Spenden_10_02");//(nahl�� do m�ce) Mmmmh hmmm...
	
	if (Npc_HasItems (other, ItMi_Gold) < 10)
	{
		AI_Output (self, other,"DIA_Daron_Spenden_10_03");//Hm, jsi uboh� du�e, �e? Nech si to m�lo, co m�.
		
		if (MIS_Thorben_GetBlessings == LOG_RUNNING)
		{
			B_LogEntry (TOPIC_Thorben,"Daron, m�g ohn�, mi necht�l po�ehnat. Nejsp� mu budu muset nejd��v poskytnout n�jak� zlato jako milodar.");
		};
	}
	else //Gold >= 10
	{
		if (Npc_HasItems (other, ItMi_Gold) < 50)
		{
			AI_Output (self, other,"DIA_Daron_Spenden_10_04");//No, nem� mnoho, ale ani nejsi chud�. 10 zlat�ch pro Innose - �ijeme skromn�.
			B_GiveInvItems (other, self, ItMi_Gold, 10);
			
		}
		else if (Npc_HasItems (other, ItMi_Gold) < 100)
		{
			AI_Output (self, other,"DIA_Daron_Spenden_10_05");//M� v�c ne� 50 zlat�ch. Daruj Innosovi 25 a dostane� jeho po�ehn�n�.
			B_GiveInvItems (other, self, ItMi_Gold, 25);
		}
		else
		{
			AI_Output (self, other,"DIA_Daron_Spenden_10_06");//M� v�c ne� sto zlat�ch - P�n ��k�, �e kdy� m�, m�l bys d�t.
			AI_Output (self, other,"DIA_Daron_Spenden_10_07");//C�rkev p�ij�m� tv�j �t�dr� dar.
			B_GiveInvItems (other, self, ItMi_Gold, 50);
			
		};
		
		AI_Output (self, other,"DIA_Daron_Spenden_10_08");//�ehn�m ti ve jm�nu Innosov�. On je sv�tlo a spravedlnost.
		Daron_Segen = TRUE;
		B_GivePlayerXP (XP_InnosSegen);
		
		if (MIS_Thorben_GetBlessings == LOG_RUNNING)
		{
			B_LogEntry (TOPIC_Thorben,"Daron, m�g ohn�, mi dal sv� po�ehn�n�.");
		};
	};
};

// ************************************************************
// 			  Wo kommst du her?
// ************************************************************
INSTANCE DIA_Daron_Woher(C_INFO)
{
	npc			= KDF_511_Daron;
	nr			= 9;
	condition	= DIA_Daron_Woher_Condition;
	information	= DIA_Daron_Woher_Info;
	permanent	= FALSE;
	description	= "Odkud jsi p�i�el?";
};                       
FUNC INT DIA_Daron_Woher_Condition()
{	
	if (other.guild != GIL_KDF)
	&& (other.guild != GIL_NOV)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Daron_Woher_Info()
{	
	AI_Output (other, self,"DIA_Daron_Woher_15_00");//Odkud jsi p�i�el?
	AI_Output (self, other,"DIA_Daron_Woher_10_01");//P�ich�z�m z kl�tera m�g�, kter� le�� v hor�ch.
	
	if (other.guild == GIL_NONE)
	{
		AI_Output (self, other,"DIA_Daron_Woher_10_02");//U n�s je v�t�n ka�d�, jeho� srdce je �ist� a c�t� pot�ebu slou�it na�emu v�emocn�mu P�nu Innosovi.
	};
};

// ************************************************************
// 			Innos
// ************************************************************
INSTANCE DIA_Daron_Innos(C_INFO)
{
	npc			= KDF_511_Daron;
	nr			= 9;
	condition	= DIA_Daron_Innos_Condition;
	information	= DIA_Daron_Innos_Info;
	permanent	= FALSE;
	description	= "Pov�z mi n�co o Innosovi.";
};                       
FUNC INT DIA_Daron_Innos_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Daron_Woher)
	&& (other.guild != GIL_KDF)
	&& (other.guild != GIL_DJG)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Daron_Innos_Info()
{	
	AI_Output (other, self,"DIA_Daron_Innos_15_00");//�ekni mi n�co o Innosovi.
	AI_Output (self, other,"DIA_Daron_Innos_10_01");//Innos, n� v�emocn� p�n, je sv�tlo a ohe�.
	AI_Output (self, other,"DIA_Daron_Innos_10_02");//Rozhodl se, �e lid� budou jeho n�strojem, a dal jim magii a z�kony.
	AI_Output (self, other,"DIA_Daron_Innos_10_03");//Jedn�me jeho jm�nem. Vykon�v�me spravedlnost dle jeho v�le a k�eme jeho slovo.
};

// ************************************************************
// 			  Kloster
// ************************************************************
INSTANCE DIA_Daron_Kloster(C_INFO)
{
	npc			= KDF_511_Daron;
	nr			= 9;
	condition	= DIA_Daron_Kloster_Condition;
	information	= DIA_Daron_Kloster_Info;
	permanent	= FALSE;
	description	= "Pov�z mi o kl�te�e.";
};                       
FUNC INT DIA_Daron_Kloster_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Daron_Woher)
	|| Npc_KnowsInfo (other, DIA_Daron_Paladine)
	&& (other.guild != GIL_NOV)
	&& (other.guild != GIL_KDF) 
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Daron_Kloster_Info()
{	
	AI_Output (other, self,"DIA_Daron_Kloster_15_00");//Pov�z mi o kl�te�e.
	AI_Output (self, other,"DIA_Daron_Kloster_10_01");//U��me na�e studenty v�echny formy magie. Ale um�n� ohniv�ch m�g� spo��v� i v n��em jin�m ne� jen v tomhle.
	AI_Output (self, other,"DIA_Daron_Kloster_10_02");//Jsme t� zb�hl� v um�n� alchymie a ve vytv��en� mocn�ch run.
	AI_Output (self, other,"DIA_Daron_Kloster_10_03");//Tak� d�l�me skv�l� v�no.
};

// ************************************************************
// 			 Stadt
// ************************************************************
INSTANCE DIA_Daron_Stadt(C_INFO)
{
	npc			= KDF_511_Daron;
	nr			= 99;
	condition	= DIA_Daron_Stadt_Condition;
	information	= DIA_Daron_Stadt_Info;
	permanent	= FALSE;
	description	= "Co d�l� ve m�st�?";
};                       
FUNC INT DIA_Daron_Stadt_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Daron_Woher)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Daron_Stadt_Info()
{	
	AI_Output (other, self,"DIA_Daron_Stadt_15_00");//Co d�l� ve m�st�?
	AI_Output (self, other,"DIA_Daron_Stadt_10_01");//Vedu jedn�n� s paladiny a jsem n�pomocen ob�an�m radou - m��u tu tam ztratit slovo.
	AI_Output (self, other,"DIA_Daron_Stadt_10_02");//Obzvl�t� v takov�chto t�k�ch dob�ch je na�� povinnost� b�t lidu ku pomoci a starat se o chud�.
};

///////////////////////////////////////////////////////////////////////
//	Info GuildHelp
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Daron_GuildHelp		(C_INFO)
{
	npc		 = 	KDF_511_Daron;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Daron_GuildHelp_Condition;
	information	 = 	DIA_Addon_Daron_GuildHelp_Info;

	description	 = 	"Donesly se mi zv�sti o jak�si so�ce...";
};

func int DIA_Addon_Daron_GuildHelp_Condition ()
{
	if (MIS_Addon_Vatras_Go2Daron == LOG_RUNNING)
	&& (Npc_KnowsInfo (other, DIA_Daron_Stadt))
		{
			return TRUE;
		};
};

func void DIA_Addon_Daron_GuildHelp_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Daron_GuildHelp_15_00"); //Sly�el jsem, �e jsi pr� ztratil n�jakou so�ku.
	AI_Output	(self, other, "DIA_Addon_Daron_GuildHelp_10_01"); //V�n�? Tak to ti mohl ��ct jedin� vodn� m�g Vatras.
	AI_Output	(other, self, "DIA_Addon_Daron_GuildHelp_15_02"); //Co m� za probl�m?
	AI_Output	(self, other, "DIA_Addon_Daron_GuildHelp_10_03"); //Z pevniny poslali do kl�tera velmi cennou so�ku. Ta se ale na m�sto ur�en� nikdy nedostala.
	AI_Output	(other, self, "DIA_Addon_Daron_GuildHelp_15_04"); //N�kdo napadl lo�?
	AI_Output	(self, other, "DIA_Addon_Daron_GuildHelp_10_05"); //(zahanben�) Ne. V po��dku dorazila do Khorinidu, kde jsem ji m�l vyzvednout.
	AI_Output	(self, other, "DIA_Addon_Daron_GuildHelp_10_06"); //Ale kdy� jsem ji nesl do kl�tera, p�epadla m� tlupa goblin�. Ti mi ji sebrali.
	AI_Output	(self, other, "DIA_Addon_Daron_GuildHelp_10_07"); //(rozho��en�) Ned�vej se na m� takhle! My m�gov� jsme taky jenom lidi, v�?
	
	MIS_Addon_Vatras_Go2Daron = LOG_SUCCESS;
	MIS_Addon_Daron_GetStatue = LOG_RUNNING;
	
	Info_ClearChoices	(DIA_Addon_Daron_GuildHelp);
	Info_AddChoice	(DIA_Addon_Daron_GuildHelp, "Tvrd�, �e ji te� maj� goblini?", DIA_Addon_Daron_GuildHelp_gobbos );
	Info_AddChoice	(DIA_Addon_Daron_GuildHelp, "Kde jsi tu so�ku ztratil?", DIA_Addon_Daron_GuildHelp_wo );
	Info_AddChoice	(DIA_Addon_Daron_GuildHelp, "Copak ses ji nepokusil z�skat zp�tky?", DIA_Addon_Daron_GuildHelp_wiederholen );
};

func void DIA_Addon_Daron_GuildHelp_wiederholen ()
{
	AI_Output			(other, self, "DIA_Addon_Daron_GuildHelp_wiederholen_15_00"); //Copak ses ji nepokusil z�skat zp�tky?
	AI_Output			(self, other, "DIA_Addon_Daron_GuildHelp_wiederholen_10_01"); //Samoz�ejm� �e pokusil! Hledal jsem ji v�ude mo�n�, ale bez �sp�chu.
};

func void DIA_Addon_Daron_GuildHelp_gobbos ()
{
	AI_Output			(other, self, "DIA_Addon_Daron_GuildHelp_gobbos_15_00"); //Tak�e te� ji maj� goblini?
	AI_Output			(self, other, "DIA_Addon_Daron_GuildHelp_gobbos_10_01"); //Ukradli mi ji, a ne� jsem se nad�l, zmizeli s n� v podrostu.
	AI_Output			(self, other, "DIA_Addon_Daron_GuildHelp_gobbos_10_02"); //U� jsem je nikdy nevid�l. Nejsp� si vyhrabali n�jakou d�ru v zemi.
};

func void DIA_Addon_Daron_GuildHelp_wo ()
{
	AI_Output			(other, self, "DIA_Addon_Daron_GuildHelp_wo_15_00"); //Kde p�esn� jsi o tu svou so�ku p�i�el?
	AI_Output			(self, other, "DIA_Addon_Daron_GuildHelp_wo_10_01"); //Na cest� do kl�tera, pobl� Orlanovy hospody.

	Info_AddChoice	(DIA_Addon_Daron_GuildHelp, "To mi sta��. J� ti tu so�ku najdu.", DIA_Addon_Daron_GuildHelp_auftrag );
	Info_AddChoice	(DIA_Addon_Daron_GuildHelp, "Orlanova hospoda? Kde to je?", DIA_Addon_Daron_GuildHelp_woTaverne );
};

func void DIA_Addon_Daron_GuildHelp_woTaverne ()
{
	AI_Output			(other, self, "DIA_Addon_Daron_GuildHelp_woTaverne_15_00"); //U Orlanovy hospody? Kde to je?
	AI_Output			(self, other, "DIA_Addon_Daron_GuildHelp_woTaverne_10_01"); //Kdy� z m�sta vyjde� touhletou branou a bude� pokra�ovat po cest�, dojde� k takov�mu domu na samot�.
	AI_Output			(self, other, "DIA_Addon_Daron_GuildHelp_woTaverne_10_02"); //A to je Orlanova hospoda. U Mrtv� harpyje.
};

func void DIA_Addon_Daron_GuildHelp_auftrag ()
{
	AI_Output			(other, self, "DIA_Addon_Daron_GuildHelp_auftrag_15_00"); //To mi sta��. J� ti tu so�ku najdu.
	AI_Output			(self, other, "DIA_Addon_Daron_GuildHelp_auftrag_10_01"); //K� t� Innos prov�z� a ochr�n� t� p�ed nebezpe��m, je� na tebe za branami m�sta ��h�.
	Info_ClearChoices	(DIA_Addon_Daron_GuildHelp);
	
	Log_CreateTopic (TOPIC_Addon_RangerHelpKDF, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_RangerHelpKDF, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_RangerHelpKDF,"N�jac� drz� goblini obrali Darona. Od t� doby Daron poh�e�uje cennou so�ku, kterou m�l don�st do kl�tera. Goblini se pr� ukr�vaj� v no�e pobl� hospody U Mrtv� harpyje."); 
};

///////////////////////////////////////////////////////////////////////
//	Info FoundStatue
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Daron_FoundStatue		(C_INFO)
{
	npc		 = 	KDF_511_Daron;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Daron_FoundStatue_Condition;
	information	 = 	DIA_Addon_Daron_FoundStatue_Info;

	description	 = 	"Na�el jsem tu tvou so�ku.";
};

func int DIA_Addon_Daron_FoundStatue_Condition ()
{
	if (Npc_HasItems (other,ItMi_LostInnosStatue_Daron))
	&& (DIA_Gorax_GOLD_perm == FALSE) 
	&& (MIS_Addon_Daron_GetStatue == LOG_RUNNING)
		{
			return TRUE;
		};
};

func void DIA_Addon_Daron_FoundStatue_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Daron_FoundStatue_15_00"); //Na�el jsem tu tvou so�ku.
	AI_Output	(self, other, "DIA_Addon_Daron_FoundStatue_10_01"); //Innos budi� pochv�len!
	AI_Output	(other, self, "DIA_Addon_Daron_FoundStatue_15_02"); //Co s n� te� bude� d�lat?
	AI_Output	(self, other, "DIA_Addon_Daron_FoundStatue_10_03"); //V�bec nic. P�inesla mi jenom sm�lu.
	AI_Output	(self, other, "DIA_Addon_Daron_FoundStatue_10_04"); //Do kl�tera ji proto odnese� TY, synku.
	if (other.guild == GIL_NONE)
	{
		AI_Output	(self, other, "DIA_Addon_Daron_FoundStatue_10_05"); //Samoz�ejm� �e t� dovnit� nepust�, pokud se neodhodl� str�vit zbytek �ivota v kl�te�e.
		AI_Output	(self, other, "DIA_Addon_Daron_FoundStatue_10_06"); //Ale ur�it� to r�d ud�l�, kdy� to bude PRO M�, �e ano?
	};
	AI_Output	(self, other, "DIA_Addon_Daron_FoundStatue_10_07"); //Jdi s Innosem, m�j synu!
};

///////////////////////////////////////////////////////////////////////
//	Info ReturnedStatue
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Daron_ReturnedStatue		(C_INFO)
{
	npc		 = 	KDF_511_Daron;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Daron_ReturnedStatue_Condition;
	information	 = 	DIA_Addon_Daron_ReturnedStatue_Info;

	description	 = 	"Donesl jsem tu tvou so�ku do kl�tera.";
};

func int DIA_Addon_Daron_ReturnedStatue_Condition ()
{
	if (DIA_Gorax_GOLD_perm == TRUE) 
	&& (MIS_Addon_Daron_GetStatue == LOG_SUCCESS)
		{
			return TRUE;
		};
};

func void DIA_Addon_Daron_ReturnedStatue_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Daron_ReturnedStatue_15_00"); //Odnesl jsem tu so�ku do kl�tera, tak�e u� te� m��e� b�t klidn�.
	AI_Output	(self, other, "DIA_Addon_Daron_ReturnedStatue_10_01"); //To je dobr� zpr�va. K� t� Innos ochra�uje.
	AI_Output	(self, other, "DIA_Addon_Daron_ReturnedStatue_10_02"); //Tohle si vezmi jako d�kaz m� vd��nosti, synku.
	CreateInvItems (self, ItMi_Gold, 150);									
	B_GiveInvItems (self, other, ItMi_Gold, 150);
	TOPIC_End_RangerHelpKDF = TRUE;		
	B_GivePlayerXP (XP_Addon_ReportLostInnosStatue2Daron);
};

// ************************************************************
// 			arm
// ************************************************************
INSTANCE DIA_Daron_arm(C_INFO)
{
	npc			= KDF_511_Daron;
	nr			= 10;
	condition	= DIA_Daron_arm_Condition;
	information	= DIA_Daron_arm_Info;
	permanent	= FALSE;
	description	= "J� jsem chud�!";
};                       
FUNC INT DIA_Daron_arm_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Daron_Stadt)
	&& (Npc_HasItems  (other, ItMi_Gold) < 10) 
	&& (other.guild == GIL_NONE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Daron_arm_Info()
{	
	AI_Output (other, self,"DIA_Daron_arm_15_00");//J� jsem chud�!
	AI_Output (self, other,"DIA_Daron_arm_10_01");//Vida, jsi bez pen�z. ��dn� div, v takov�to dob�. Vezmi si tyhle zla��ky, snad ti budou ku prosp�chu.
	AI_Output (self, other,"DIA_Daron_arm_10_02");//Ale m�l by ses pokusit naj�t si pr�ci, pen�ze se k tob� pak jen pohrnou. A pak bys mohl obdarovat Innosovu c�rkev, stejn� jako ona obdarovala tebe.
	
	B_GiveInvItems (self, other, ItMi_Gold, 20);
};

// ************************************************************
// 			 Immer wieder spenden 
// ************************************************************
INSTANCE DIA_Daron_Spende(C_INFO)
{
	npc			= KDF_511_Daron;
	nr			= 990;
	condition	= DIA_Daron_Spende_Condition;
	information	= DIA_Daron_Spende_Info;
	permanent	= TRUE;
	description	= "R�d bych v�noval n�jak� dar...";
};      
//-------------------------------------
var int DIA_Daron_Spende_permanent;
//-------------------------------------                 
FUNC INT DIA_Daron_Spende_Condition()
{	
	if Npc_IsInState (self, ZS_Talk)
	&& (DIA_Daron_Spende_permanent == FALSE)
	&& Npc_KnowsInfo (other,DIA_Daron_Spenden)
	&& (hero.guild != GIL_KDF)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Daron_Spende_Info()
{	
	
	AI_Output (other, self,"DIA_Daron_Spende_15_00");//R�d bych v�noval n�jak� dar.
	
	Info_ClearChoices (DIA_Daron_Spende);
	
	if (Daron_Spende < 1000)
	{
		Info_AddChoice 	(DIA_Daron_Spende,"Ale nem�m dost zlata... (ZP�T)",DIA_Daron_Spende_BACK);
		
		Info_AddChoice 	(DIA_Daron_Spende,"(50 zla��k�)",DIA_Daron_Spende_50);
		Info_AddChoice 	(DIA_Daron_Spende,"(100 zla��k�)",DIA_Daron_Spende_100);
		Info_AddChoice 	(DIA_Daron_Spende,"(200 zla��k�)",DIA_Daron_Spende_200);
	 }
	 else 
	 {
	 	AI_Output (self, other,"DIA_Daron_Spende_10_01");//Celkem jsi mi daroval v�ce ne� 1000 zlat�ch.
	 	AI_Output (self, other,"DIA_Daron_Spende_10_02");//Po�ehn�n� P�na Innose bude neust�le s tebou.
	 	
	 	DIA_Daron_Spende_permanent = TRUE;	
		B_DaronSegen ();
	 };
};
FUNC VOID DIA_Daron_Spende_BACK()
{
	AI_Output (other, self,"DIA_Daron_Spende_BACK_15_00"); //Ale nep�inesl jsem dost pen�z.
	AI_Output (self, other,"DIA_Daron_Spende_BACK_10_01"); //To nevad�, m�j synu. M��e� d�t pozd�ji, kolik jen bude� cht�t.
	
	Info_ClearChoices (DIA_Daron_Spende);
};	
//----------------------------
var int Daron_Spende;
//----------------------------
FUNC VOID DIA_Daron_Spende_50()
{
	if B_GiveInvItems (other, self, ItMi_Gold, 50)
	{
		AI_Output (self, other,"DIA_Daron_Spende_50_10_00");//�ehn�m ti ve jm�nu Innosov�. On je sv�tlo a spravedlnost.
		Daron_Spende = (Daron_Spende + 50);
		B_DaronSegen ();
		Daron_Segen = TRUE;
		if (MIS_Thorben_GetBlessings == LOG_RUNNING)
		{
			B_LogEntry (TOPIC_Thorben,"Daron, m�g ohn�, mi dal sv� po�ehn�n�.");
		};
	}
	else
	{
		AI_Output (self, other,"DIA_Daron_Spende_50_10_01");//Sv�j dar m��e� d�t kdykoliv pozd�ji, a� u sebe bude� m�t dost pen�z.
	};
	Info_ClearChoices (DIA_Daron_Spende);
};
FUNC VOID DIA_Daron_Spende_100()
{
	if B_GiveInvItems (other, self, ItMi_Gold, 100)
	{
		AI_Output (self, other,"DIA_Daron_Spende_100_10_00");//Innosi, jsi sv�tlo, je� z��� na cestu spravedliv�ch.
		AI_Output (self, other,"DIA_Daron_Spende_100_10_01");//Tv�m jm�nem �ehn�m tomuto mu�i. Nech� na n�j z��� tv� sv�tlo.
		Daron_Spende = (Daron_Spende + 100);
		B_DaronSegen ();
		Daron_Segen = TRUE;
		if (MIS_Thorben_GetBlessings == LOG_RUNNING)
		{
			B_LogEntry (TOPIC_Thorben,"Daron, m�g ohn�, mi dal sv� po�ehn�n�.");
		};
	}
	else
	{
		AI_Output (self, other,"DIA_Daron_Spende_100_10_02");//P�n ��k� - chce�-li se modlit, otev�i svou du�i. A chce�-li v�novat dar, p�ines jej s sebou.
	};
	Info_ClearChoices (DIA_Daron_Spende);
};
FUNC VOID DIA_Daron_Spende_200()
{
	if B_GiveInvItems (other, self, ItMi_Gold, 200)
	{
		AI_Output (self, other,"DIA_Daron_Spende_200_10_00");//Innos, po�ehnej tomuto mu�i. Nech� na n�j z��� tv� sv�tlo.
		AI_Output (self, other,"DIA_Daron_Spende_200_10_01");//Dej mu s�lu chovat se spravedliv�.
		Daron_Spende = (Daron_Spende + 200);
		B_DaronSegen ();
		Daron_Segen = TRUE;
		if (MIS_Thorben_GetBlessings == LOG_RUNNING)
		{
			B_LogEntry (TOPIC_Thorben,"Daron, m�g ohn�, mi dal sv� po�ehn�n�.");
		};
	}
	else
	{
		AI_Output (self, other,"DIA_Daron_Spende_200_10_02");//Pokud bys cht�l darovat tolik pen�z, m�l bys je s sebou tak� p�in�st.
	};
	Info_ClearChoices (DIA_Daron_Spende);
};


	
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Daron_PICKPOCKET (C_INFO)
{
	npc			= KDF_511_Daron;
	nr			= 900;
	condition	= DIA_Daron_PICKPOCKET_Condition;
	information	= DIA_Daron_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Daron_PICKPOCKET_Condition()
{
	C_Beklauen (47, 80);
};
 
FUNC VOID DIA_Daron_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Daron_PICKPOCKET);
	Info_AddChoice		(DIA_Daron_PICKPOCKET, DIALOG_BACK 		,DIA_Daron_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Daron_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Daron_PICKPOCKET_DoIt);
};

func void DIA_Daron_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Daron_PICKPOCKET);
};
	
func void DIA_Daron_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Daron_PICKPOCKET);
};











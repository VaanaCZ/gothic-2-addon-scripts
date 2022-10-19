///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Jora_EXIT   (C_INFO)
{
	npc         = VLK_408_Jora;
	nr          = 999;
	condition   = DIA_Jora_EXIT_Condition;
	information = DIA_Jora_EXIT_Info;
	permanent   = TRUE;
	description = "Mus�m j�t!";
};

FUNC INT DIA_Jora_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Jora_EXIT_Info()
{
	if ( (Jora_Dieb == LOG_FAILED) || (Jora_Dieb == LOG_SUCCESS) )
	&& (Jora_Gold == LOG_RUNNING)
	{
		AI_Output (self, other, "DIA_Jora_EXIT_08_00"); //Hej! A co moje prachy?
	};
	
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info Sperre
///////////////////////////////////////////////////////////////////////
instance DIA_Jora_Sperre		(C_INFO)
{
	npc			 = 	VLK_408_Jora;
	nr			 = 	2;
	condition	 = 	DIA_Jora_Sperre_Condition;
	information	 = 	DIA_Jora_Sperre_Info;
	permanent	 =  TRUE;
	important	 = 	TRUE;
};
func int DIA_Jora_Sperre_Condition ()
{
	if (Canthar_Sperre == TRUE)
	&& (Npc_IsInState (self,ZS_Talk ))
	{
		return TRUE;
	};
};
func void DIA_Jora_Sperre_Info ()
{
	AI_Output (self, other, "DIA_Jora_Sperre_08_00"); //Jsi b�val� trestanec z d�ln� kolonie, nic ti neprod�m!
	AI_StopProcessInfos (self);	 
};
///////////////////////////////////////////////////////////////////////
//	Info WAREZ
///////////////////////////////////////////////////////////////////////
instance DIA_Jora_WAREZ		(C_INFO)
{
	npc			 = 	VLK_408_Jora;
	nr			 = 	700;
	condition	 = 	DIA_Jora_WAREZ_Condition;
	information	 = 	DIA_Jora_WAREZ_Info;
	permanent	 = 	TRUE;
	trade		 = 	TRUE;
	description	 = 	"Uka� mi sv� zbo��.";
};
func int DIA_Jora_WAREZ_Condition ()
{
	return TRUE;
};
func void DIA_Jora_WAREZ_Info ()
{
	B_GiveTradeInv (self);
	AI_Output (other, self, "DIA_Jora_WAREZ_15_00"); //Uka� mi sv� zbo��.
};

///////////////////////////////////////////////////////////////////////
//	Info GREET
///////////////////////////////////////////////////////////////////////
instance DIA_Jora_GREET		(C_INFO)
{
	npc			= VLK_408_Jora;
	nr			= 1;
	condition	= DIA_Jora_GREET_Condition;
	information	= DIA_Jora_GREET_Info;
	permanent 	= FALSE;
	important	= TRUE;
};
func int DIA_Jora_GREET_Condition ()
{	
	if Npc_IsInState (self, ZS_Talk)
	&& (Canthar_Sperre == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Jora_GREET_Info ()
{
	AI_Output (self, other, "DIA_Jora_GREET_08_00"); //Innos t� prov�zej, cizin�e. Jestli si chce� po��dit dobrou cestovatelskou v�bavu, pak jsi na tom spr�vn�m m�st�.
	AI_Output (self, other, "DIA_Jora_GREET_08_01"); //Ale varuji t�: jestli m� v pl�nu si invent�� vylep�it n�jak pokoutn� bez placen�, zavol�m str�e!
	AI_Output (other, self, "DIA_Jora_GREET_15_02"); //Po�kej, copak vypad�m jako n�jak� chmat�k?
	AI_Output (self, other, "DIA_Jora_GREET_08_03"); //(pohrdav�) Pche! Dneska bys nebyl prvn�, kdo by se mi sna�il n�co �majznout.

	Log_CreateTopic (Topic_CityTrader,LOG_NOTE);
	B_LogEntry (Topic_CityTrader,"Jora prod�v� na tr�i�ti v�echny mo�n� zbran�.");
};

// *******************************************************
// 					Du bestohlen?
// *******************************************************
instance DIA_Jora_Bestohlen	(C_INFO)
{
	npc			 = 	VLK_408_Jora;
	nr			 = 	1;
	condition	 = 	DIA_Jora_Bestohlen_Condition;
	information	 = 	DIA_Jora_Bestohlen_Info;
	permanent	 = 	FALSE;
	description	 = 	"N�kdo t� okradl?";
};
func int DIA_Jora_Bestohlen_Condition ()
{
	return TRUE;
};
func void DIA_Jora_Bestohlen_Info ()
{
	AI_Output (other, self, "DIA_Jora_Bestohlen_15_00"); //N�kdo t� okradl?
	AI_Output (self, other, "DIA_Jora_Bestohlen_08_01"); //Nem��u to dok�zat, ten man�k byl zatracen� chytr�. P�edstavil se jako Rengaru - pokud to tedy je jeho skute�n� jm�no.
	AI_Output (self, other, "DIA_Jora_Bestohlen_08_02"); //Posledn�ch p�r dn� jen tak zevloval na tr�i�ti.
	if (Npc_GetDistToWP (self, "NW_CITY_MERCHANT_PATH_38") <= 500)
	{
		AI_Output (self, other, "DIA_Jora_Bestohlen_08_03"); //A ka�d� ve�er se p��mo na ulici nal�v� pivem. Vsad�m boty, �e ten �mejd chlast� za MOJE pen�ze!
	};
	AI_Output (self, other, "DIA_Jora_Bestohlen_08_04"); //Jen jsem se na chvilku pod�val jinam a u� jsem byl bez portmonky!
};


// ******************
// B_Jora_GoldForClue
// ******************

func void B_Jora_GoldForClue()
{
	AI_Output (self ,other,"DIA_Jora_Add_08_04"); //Posly� - jestli se ti povede z toho Rengaru vyt��skat moje prachy, pov�m ti v�echno, co v�m.
};


// *******************************************************
// 					Ich hol dir dein Gold
// *******************************************************
instance DIA_Jora_HolDeinGold	(C_INFO)
{
	npc			 = 	VLK_408_Jora;
	nr			 = 	1;
	condition	 = 	DIA_Jora_HolDeinGold_Condition;
	information	 = 	DIA_Jora_HolDeinGold_Info;
	permanent	 = 	FALSE;
	description	 = 	"Mohl bych se pokusit z�skat zp�tky tvoje pen�ze.";
};
func int DIA_Jora_HolDeinGold_Condition ()
{
	if (Npc_KnowsInfo(other,DIA_Jora_Bestohlen))
	{
		return TRUE;
	};
};
func void DIA_Jora_HolDeinGold_Info ()
{
	AI_Output (other, self, "DIA_Jora_HolDeinGold_15_00"); //Mohl bych se pokusit z�skat zp�tky tvoje pen�ze.
	AI_Output (self, other, "DIA_Jora_HolDeinGold_08_01"); //(ned�v��iv�) Fakt? A jak to chce� ud�lat?

	Info_ClearChoices (DIA_Jora_HolDeinGold);
	Info_AddChoice 		(DIA_Jora_HolDeinGold,"Ale za odm�nu chci ��st zlata!",DIA_Jora_HolDeinGold_WillBelohnung);
	if (Mis_Andre_GuildOfThieves == LOG_RUNNING)
	{
		Info_AddChoice (DIA_Jora_HolDeinGold,"R�d bych se dozv�d�l, jak se dostat do cechu zlod�j�.", DIA_Jora_HolDeinGold_GHDG);
	};
	if (other.guild == GIL_NONE)
	&& (Player_IsApprentice == APP_NONE)
	{
		Info_AddChoice (DIA_Jora_HolDeinGold,"P�ijde na to - m��u se s tvou pomoc� dostat do horn� �tvrti?", DIA_Jora_HolDeinGold_ToOV);
	};
};

func void DIA_Jora_HolDeinGold_ToOV()
{
	AI_Output (other, self,"DIA_Jora_Add_15_00"); //P�ijde na to - m��u se s tvou pomoc� dostat do horn� �tvrti?
	AI_Output (self, other, "DIA_Jora_HolDeinGold_08_03"); //(sm�je se) To jsi na �patn� adrese, j� v�bec nejsem z m�sta - jako v�t�ina kupc� na tr�i�ti.
	AI_Output (self ,other,"DIA_Jora_Add_08_01"); //Jestli se chce� dostat do horn� �tvrti, promluv si v doln� ��sti m�sta s n�kter�mi m�stn�mi obchodn�ky.
};

func void DIA_Jora_HolDeinGold_GHDG()
{
	AI_Output (other, self,"DIA_Jora_Add_15_02"); //R�d bych se dozv�d�l, jak se dostat do cechu zlod�j�.
	AI_Output (self ,other,"DIA_Jora_Add_08_03"); //Mo�n� �e ti m��u pomoct.
	B_Jora_GoldForClue();

	Info_ClearChoices (DIA_Jora_HolDeinGold);
	Info_AddChoice (DIA_Jora_HolDeinGold,"Uvid�m, co se d� d�lat.",	DIA_Jora_HolDeinGold_DoIt);
	Info_AddChoice (DIA_Jora_HolDeinGold,"Kolik pen�z to bylo?",			DIA_Jora_HolDeinGold_HowMuch);
	Info_AddChoice (DIA_Jora_HolDeinGold,"Pro� jsi nezavolal str�e?",DIA_Jora_HolDeinGold_Wache);	
};

func void DIA_Jora_HolDeinGold_WillBelohnung()
{
	AI_Output (other, self, "DIA_Jora_HolDeinGold_WillBelohnung_15_00"); //Ale za odm�nu chci ��st zlata!
	AI_Output (self, other, "DIA_Jora_HolDeinGold_WillBelohnung_08_01"); //Nejd��v se postarej o to, aby mi vr�tili portmonku, a teprve PAK si promluv�me o odm�n�!
	Info_ClearChoices (DIA_Jora_HolDeinGold);
	Info_AddChoice (DIA_Jora_HolDeinGold,"Uvid�m, co se d� d�lat.",	DIA_Jora_HolDeinGold_DoIt);
	Info_AddChoice (DIA_Jora_HolDeinGold,"Kolik pen�z to bylo?",			DIA_Jora_HolDeinGold_HowMuch);
	Info_AddChoice (DIA_Jora_HolDeinGold,"Pro� jsi nezavolal str�e?",DIA_Jora_HolDeinGold_Wache);
};

func void DIA_Jora_HolDeinGold_Wache()
{
	AI_Output (other, self, "DIA_Jora_HolDeinGold_Wache_15_00"); //Pro� jsi nezavolal str�e?
	AI_Output (self, other, "DIA_Jora_HolDeinGold_Wache_08_01"); //Str�e jsou n�co platn�, pouze pokud zlod�je p�istihne� p�i �inu.
	AI_Output (self, other, "DIA_Jora_HolDeinGold_Wache_08_02"); //A kdy� jsem zjistil, �e jsem bez portmonky, ten parchant u� byl d�vno v prachu!
};

func void DIA_Jora_HolDeinGold_HowMuch()
{
	AI_Output (other, self, "DIA_Jora_HolDeinGold_HowMuch_15_00"); //Kolik pen�z to bylo?
	AI_Output (self, other, "DIA_Jora_HolDeinGold_HowMuch_08_01"); //50 zla��k� - v t�hle mizern� dob� je to v�c ne� dost.
};

func void DIA_Jora_HolDeinGold_DoIt()
{
	AI_Output (other, self, "DIA_Jora_HolDeinGold_DoIt_15_00"); //Uvid�m, co se d� d�lat.
	AI_Output (self, other, "DIA_Jora_HolDeinGold_DoIt_08_01"); //Dej si pozor. Jestli toho lotra jen tak zml�t�, vlo�� se do toho str�e.
	AI_Output (self, other, "DIA_Jora_HolDeinGold_DoIt_08_02"); //Posledn� dobou je to tu p�kn� drsn�. Od chv�le, co do m�sta p�ibyli paladinov�, str�e ka�d�ho rv��e bez milosti sejmou.
	AI_Output (self, other, "DIA_Jora_HolDeinGold_DoIt_08_03"); //Bude� si muset n�co vymyslet.
	AI_Output (other, self, "DIA_Jora_HolDeinGold_DoIt_15_04"); //Jasn�.
		
	Jora_Dieb = LOG_RUNNING;
	Jora_Gold = LOG_RUNNING;
	
	Log_CreateTopic (Topic_JoraDieb,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_JoraDieb,LOG_RUNNING);
	Log_CreateTopic (TOPIC_Jora,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Jora,LOG_RUNNING);
	
	B_LogEntry (TOPIC_Jora, "Obchodn�ka Jora okradl chlap�k jm�nem Rengaru, kter� se p�es den potuluje po tr�i�ti.");
	B_LogEntry (TOPIC_Jora, "Mus�m Jorovi vr�tit ukraden� zlato.");
	B_LogEntry (TOPIC_JoraDieb, "Obchodn�ka Jora okradl chlap�k jm�nem Rengaru - jestli ho chyt�m, mo�n� z toho bude koukat i n�jak� odm�na.");

	Info_ClearChoices 	(DIA_Jora_HolDeinGold);
};

// *******************************************************
// 					Wegen Dieb...
// *******************************************************
instance DIA_Jora_WegenDieb	(C_INFO)
{
	npc			 = 	VLK_408_Jora;
	nr			 = 	2;
	condition	 = 	DIA_Jora_WegenDieb_Condition;
	information	 = 	DIA_Jora_WegenDieb_Info;
	permanent	 = 	TRUE;
	description	 = 	"K tomu zlod�ji...";
};
func int DIA_Jora_WegenDieb_Condition ()
{
	if (Jora_Dieb == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Jora_WegenDieb_Info ()
{
	AI_Output (other, self, "DIA_Jora_WegenDieb_15_00"); //K tomu zlod�ji...
	AI_Output (self, other, "DIA_Jora_WegenDieb_08_01"); //Tak jak to vypad�? Chytils ho, a co je d�le�it�j��, m� to moje zlato?
	
	Info_ClearChoices (DIA_Jora_WegenDieb);
	
	if (Npc_IsDead (Rengaru))
	{
		Info_AddChoice (DIA_Jora_WegenDieb,"No, stala se mu takov� tragick� nehoda...",DIA_Jora_WegenDieb_Tot);
	}
	else if (Rengaru_InKnast == TRUE)
	{	
		Info_AddChoice (DIA_Jora_WegenDieb,"U� jsem ho dostal. Je to v klidu.",DIA_Jora_WegenDieb_ImKnast);
	}
	else if (Npc_KnowsInfo (other, DIA_Rengaru_HALLODIEB))
	{
		Info_AddChoice (DIA_Jora_WegenDieb,"Utekl mi.",DIA_Jora_WegenDieb_Entkommen);
	};
	
	Info_AddChoice (DIA_Jora_WegenDieb,"Je�t� st�le na tom pracuji.",DIA_Jora_WegenDieb_Continue);
};

func void DIA_Jora_WegenDieb_Continue()
{
	AI_Output (other, self, "DIA_Jora_WegenDieb_Continue_15_00"); //Je�t� st�le na tom pracuji.
	AI_Output (self, other, "DIA_Jora_WegenDieb_Continue_08_01"); //Tak koukej, a� u� to zlato m�m zp�tky!
	Info_ClearChoices (DIA_Jora_WegenDieb);
};

func void DIA_Jora_WegenDieb_Entkommen()
{
	AI_Output (other, self, "DIA_Jora_WegenDieb_Entkommen_15_00"); //Utekl mi.
	AI_Output (self, other, "DIA_Jora_WegenDieb_Entkommen_08_01"); //A co moje zlato? To se taky ztratilo s n�m?
	Jora_Dieb = LOG_FAILED;
	B_CheckLog();
	Info_ClearChoices (DIA_Jora_WegenDieb);

};

func void DIA_Jora_WegenDieb_ImKnast()
{
	AI_Output (other, self, "DIA_Jora_WegenDieb_ImKnast_15_00"); //Ano, chytil jsem ho. Te� bude chv�li bru�et v base.
	AI_Output (self, other, "DIA_Jora_WegenDieb_ImKnast_08_01"); //A co moje zlato?
	Jora_Dieb = LOG_SUCCESS;
	B_CheckLog();
	Info_ClearChoices (DIA_Jora_WegenDieb);
};

func void DIA_Jora_WegenDieb_Tot()
{
	AI_Output (other, self, "DIA_Jora_WegenDieb_Tot_15_00"); //No, stala se mu takov� tragick� nehoda...
	AI_Output (self, other, "DIA_Jora_WegenDieb_Tot_08_01"); //Aspo� u� nikomu nic neukradne. Innosova spravedlnost zv�t�zila!
	AI_Output (self, other, "DIA_Jora_WegenDieb_Tot_08_02"); //Kde je moje zlato?
	Jora_Dieb = LOG_SUCCESS;
	B_CheckLog();
	Info_ClearChoices (DIA_Jora_WegenDieb);
};


// *******************************************************
// 					Gold zur�ckbringen
// *******************************************************
instance DIA_Jora_BringGold (C_INFO)
{
	npc			 = 	VLK_408_Jora;
	nr			 = 	2;
	condition	 = 	DIA_Jora_BringGold_Condition;
	information	 = 	DIA_Jora_BringGold_Info;
	permanent	 = 	TRUE;
	description	 = 	"Tady je t�ch 50 zla��k�, co ti ukradl.";
};

func int DIA_Jora_BringGold_Condition ()
{
	if ( (Jora_Dieb == LOG_FAILED) || (Jora_Dieb == LOG_SUCCESS) )
	&& (Jora_Gold == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Jora_BringGold_Info ()
{
	AI_Output (other, self, "DIA_Jora_BringGold_15_00"); //Tady je t�ch 50 zla��k�, co ti ukradl.
	
	if (B_GiveInvItems (other, self, itmi_gold, 50))
	{
		AI_Output (self, other,"DIA_Jora_BringGold_08_01"); //Innos bu� pochv�len! Tak p�ece je tady ve m�st� je�t� n�jak� spravedlnost!
	
		Jora_Gold = LOG_SUCCESS;
		B_GivePlayerXP(XP_Jora_Gold);
	}
	else
	{
		AI_Output (self, other,"DIA_Jora_BringGold_08_03"); //Hej, tohle nen� 50 zla��k�! Sna�� se m� taky o�kubat, nebo co?
	};
};

// *******************************************************
// 					GHDG Info
// *******************************************************

var int Jora_GhdgHinweis;
// ----------------------

instance DIA_Jora_GHDgInfo (C_INFO)
{
	npc			 = 	VLK_408_Jora;
	nr			 = 	2;
	condition	 = 	DIA_Jora_GHDgInfo_Condition;
	information	 = 	DIA_Jora_GHDgInfo_Info;
	permanent	 = 	TRUE;
	description	 = 	"Co v� o cechu zlod�j�?";
};

func int DIA_Jora_GHDgInfo_Condition ()
{
	if (Mis_Andre_GuildOfThieves == LOG_RUNNING)
	&& (Npc_KnowsInfo (other, DIA_Jora_Bestohlen))
	&& (Jora_GhdgHinweis == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Jora_GHDgInfo_Info ()
{
	AI_Output (other, self,"DIA_Jora_Add_15_05"); //Co v� o cechu zlod�j�?
	if (Jora_Gold != LOG_SUCCESS)
	{
		B_Jora_GoldForClue();
	}
	else
	{
		AI_Output (self ,other,"DIA_Jora_Add_08_06"); //No dob�e, tak poslouchej- ale jako bych ti nic ne�ekl, kapi�to?
		AI_Output (self ,other,"DIA_Jora_Add_08_07"); //Do kr�my v doc�ch chod� p�r podez�el�ch t�pk�.
		AI_Output (self ,other,"DIA_Jora_Add_08_08"); //Vsad�m se, �e i s�m kr�m�� jich n�kolik zn�.
		AI_Output (self ,other,"DIA_Jora_Add_08_09"); //Jestli chce� vystopovat zlod�je, zkus si promluvit pr�v� s N�M.
		AI_Output (self ,other,"DIA_Jora_Add_08_10"); //M��e� t�eba p�edst�rat, �e ses zapletl do n��eho nekal�ho. Na to by mohl nalet�t.
		AI_Output (self ,other,"DIA_Jora_Add_08_11"); //Ale m�j p�itom o�i otev�en� - s t�mi lidmi si nen� radno zahr�vat.
		
		Jora_GhdgHinweis = TRUE;
	};
};

// *******************************************************
// 						Belohnung
// *******************************************************
instance DIA_Jora_Belohnung (C_INFO)
{
	npc			 = 	VLK_408_Jora;
	nr			 = 	1;
	condition	 = 	DIA_Jora_Belohnung_Condition;
	information	 = 	DIA_Jora_Belohnung_Info;
	permanent	 = 	FALSE;
	description	 = 	"Ale za odm�nu chci ��st zlata!";
};

func int DIA_Jora_Belohnung_Condition ()
{
	if (Jora_Gold == LOG_SUCCESS)
	{
		return TRUE;
	};
};
func void DIA_Jora_Belohnung_Info ()
{
	AI_Output (other, self, "DIA_Jora_Belohnung_15_00"); //Ale za odm�nu chci ��st zlata!
	if (Jora_GhdgHinweis == TRUE)
	{
		AI_Output (self ,other,"DIA_Jora_Add_08_12"); //Ale j� u� jsem ti dal cennou radu.
		AI_Output (self ,other,"DIA_Jora_Add_08_13"); //Tohle by jako odm�na m�lo sta�it.
	};
	AI_Output (self ,other,"DIA_Jora_Add_08_14"); //Jestli chce� zlato, tak vyp�trej zlod�je a pak si u lorda Andre vyzvedni odm�nu.
	
	if (Npc_GetDistToWP (self, "NW_CITY_MERCHANT_PATH_38") <= 500)
	{
		AI_Output (self, other, "DIA_Jora_Belohnung_08_03"); //Te� se mus�m zase v�novat z�kazn�k�m.
	};
	AI_StopProcessInfos (self); 
};

// *****************************************************
// 				Nach Alriks Schwert fragen
// *****************************************************
instance DIA_Jora_AlriksSchwert	(C_INFO)
{
	npc			 = 	VLK_408_Jora;
	nr			 = 	1;
	condition	 = 	DIA_Jora_AlriksSchwert_Condition;
	information	 = 	DIA_Jora_AlriksSchwert_Info;
	permanent	 = 	FALSE;
	description	 = 	"Alrik tvrd�, �e m� jeho me�.";
};
func int DIA_Jora_AlriksSchwert_Condition ()
{
	if (MIS_Alrik_Sword == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Jora_AlriksSchwert_Info ()
{
	AI_Output (other, self, "DIA_Jora_AlriksSchwert_15_00"); //Alrik tvrd�, �e m� jeho me�.
	AI_Output (self, other, "DIA_Jora_AlriksSchwert_08_01"); //Mysl� toho otrhance, co mi prodal svou zbra� za p�r pochodn� a kousk� masa?
	AI_Output (other, self, "DIA_Jora_AlriksSchwert_15_02"); //Jo, to je on.
	
	if (Npc_HasItems (self, ItMw_AlriksSword_Mis) > 0)
	{
		AI_Output (self, other, "DIA_Jora_AlriksSchwert_08_03"); //Jeho me� po��d je�t� m�m.
		AI_Output (other, self, "DIA_Jora_AlriksSchwert_15_04"); //A kolik za n�j bude� cht�t?
		if (Jora_Gold == LOG_SUCCESS) 
		{
			AI_Output (self, other, "DIA_Jora_AlriksSchwert_08_05"); //No, �e jsi to ty...
			AI_Output (self, other, "DIA_Jora_AlriksSchwert_08_06"); //�le, v� co? Vem si ho zadarmo. Kdy� u� nic jin�ho, vr�tils mi moje pen�ze.
			B_GiveInvItems (self, other, ItMw_AlriksSword_Mis, 1);
		}
		else
		{
			AI_Output (self, other, "DIA_Jora_AlriksSchwert_08_07"); //No, �e jsi to ty - 50 zla��k�.
		};
	}
	else
	{
		AI_Output (self, other, "DIA_Jora_AlriksSchwert_08_08"); //(mrzut�) J� u� ho ale nem�m! �ert v�, kam se pod�l.
	};
};


// *****************************************************
// 				Alriks Schwert KAUFEN
// *****************************************************
instance DIA_Jora_BUYAlriksSchwert	(C_INFO)
{
	npc			 = 	VLK_408_Jora;
	nr			 = 	2;
	condition	 = 	DIA_Jora_BUYAlriksSchwert_Condition;
	information	 = 	DIA_Jora_BUYAlriksSchwert_Info;
	permanent	 = 	TRUE;
	description	 = 	"Tady je 50 zla��k�, a te� mi dej Alrik�v me�.";
};
func int DIA_Jora_BUYAlriksSchwert_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Jora_AlriksSchwert))
	&& (Npc_HasItems (self, ItMw_AlriksSword_Mis) > 0)
	{
		return TRUE;
	};
};
func void DIA_Jora_BUYAlriksSchwert_Info ()
{
	AI_Output (other, self, "DIA_Jora_BUYAlriksSchwert_15_00"); //Tady je 50 zla��k�, a te� mi dej Alrik�v me�.

	if (B_GiveInvItems(other,self,itmi_gold,50))
	{
		//if (Jora_Gold == LOG_RUNNING)
		//{
			//AI_Output (other, self, "DIA_Jora_BUYAlriksSchwert_15_02"); //Moment, ich wollte das Schwert kaufen...
			//AI_Output (self, other, "DIA_Jora_BUYAlriksSchwert_08_03"); //Das kannst du doch immer noch tun - f�r 50 Goldst�cke ist es deins...
			//Jora_Gold = LOG_SUCCESS;
		//}
		//else
		//{
			AI_Output (self, other, "DIA_Jora_BUYAlriksSchwert_08_04"); //Tum� - (vychytrale) byl to dobr� obchod.
			B_GiveInvItems (self, other, ItMw_AlriksSword_Mis, 1);
		//};
	}
	else
	{
		AI_Output (self, other, "DIA_Jora_BUYAlriksSchwert_08_05"); //Nem� sice dost zlata, ale to nevad� - n�jak� �as ti tu ten me� odlo��m. Tak�e se m��e� vr�tit pozd�ji.
	};
};



// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Jora_PICKPOCKET (C_INFO)
{
	npc			= VLK_408_Jora;
	nr			= 900;
	condition	= DIA_Jora_PICKPOCKET_Condition;
	information	= DIA_Jora_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Jora_PICKPOCKET_Condition()
{
	C_Beklauen (31, 45);
};
 
FUNC VOID DIA_Jora_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Jora_PICKPOCKET);
	Info_AddChoice		(DIA_Jora_PICKPOCKET, DIALOG_BACK 		,DIA_Jora_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Jora_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Jora_PICKPOCKET_DoIt);
};

func void DIA_Jora_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Jora_PICKPOCKET);
};
	
func void DIA_Jora_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Jora_PICKPOCKET);
};










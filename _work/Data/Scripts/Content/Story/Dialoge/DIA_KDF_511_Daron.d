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
	AI_Output (self, other,"DIA_Daron_Hallo_10_00");//Co mog� dla ciebie zrobi�? Szukasz duchowego wsparcia?
	AI_Output (self, other,"DIA_Daron_Hallo_10_01");//Pragniesz skierowa� modlitw� do Innosa, czy te� chcesz z�o�y� niewielk� ofiar� w z�ocie dla naszego ko�cio�a?
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
	description = "Musz� porozmawia� z paladynami...";
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
	AI_Output (other, self,"DIA_Daron_Paladine_15_00");//Musz� porozmawia� z paladynami. Czy pomo�esz mi skontaktowa� si� z nimi?
	AI_Output (self, other,"DIA_Daron_Paladine_10_01");//Musisz dosta� si� do g�rnego miasta. Jednak wst�p do niego zarezerwowany jest dla obywateli i stra�y miejskiej.
	AI_Output (self, other,"DIA_Daron_Paladine_10_02");//No i oczywi�cie dla nas, Mag�w Ognia.
	AI_Output (other, self,"DIA_Daron_Paladine_15_03");//Jak mog� zosta� Magiem Ognia?
	AI_Output (self, other,"DIA_Daron_Paladine_10_04");//Musisz wst�pi� do naszego zakonu jako nowicjusz. Niewykluczone, �e po jakim� czasie zostaniesz przyj�ty do kr�gu mag�w.
	AI_Output (self, other,"DIA_Daron_Paladine_10_05");//Jednak �cie�ka prowadz�ca do tego celu jest d�uga, kr�ta i pe�na wyboj�w.
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
	description = "Przyszed�em po b�ogos�awie�stwo!";
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
	AI_Output (other, self,"DIA_Daron_AboutSegen_15_00"); //Przyszed�em po b�ogos�awie�stwo!
	AI_Output (self, other,"DIA_Daron_AboutSegen_10_01"); //To dobrze, to bardzo dobrze - z pewno�ci� zechcesz zasili� �wi�ty ko�ci� Innosa jak�� skromn� sumk�?
	AI_Output (other, self,"DIA_Daron_AboutSegen_15_02"); //W�a�ciwie to potrzebuj� twojego b�ogos�awie�stwa, �eby zosta� czeladnikiem w dolnej cz�ci miasta...
	if (Daron_Segen == TRUE)
	{
		AI_Output (self, other,"DIA_Daron_AboutSegen_10_03"); //Ju� dosta�e� moje b�ogos�awie�stwo, synu.
		AI_Output (self, other,"DIA_Daron_AboutSegen_10_04"); //Niech ci� Innos prowadzi, synu!
	}
	else
	{
		AI_Output (self, other,"DIA_Daron_AboutSegen_10_05"); //Ale� synu! Bez skromnej ofiary nie b�d� ci� m�g� pob�ogos�awi�!
		AI_Output (self, other,"DIA_Daron_AboutSegen_10_06"); //Jak inaczej m�g�bym si� upewni� co do twoich dobrych intencji wobec naj�wi�tszego ko�cio�a Innosa?
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
	description	= "Ile wynosi przeci�tna ofiara?";
};                       
FUNC INT DIA_Daron_Spenden_Condition()
{	if (hero.guild != GIL_KDF)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Daron_Spenden_Info()
{	
	AI_Output (other, self,"DIA_Daron_Spenden_15_00");//Ile wynosi przeci�tna ofiara?
	AI_Output (self, other,"DIA_Daron_Spenden_10_01");//To zale�y od twojego stanu maj�tkowego. Zobaczmy, ile przynios�e�.
	AI_Output (self, other,"DIA_Daron_Spenden_10_02");//Mmmm hmmm...
	
	if (Npc_HasItems (other, ItMi_Gold) < 10)
	{
		AI_Output (self, other,"DIA_Daron_Spenden_10_03");//Nie nale�ysz do bogaczy, co? Zostaw sobie te par� monet.
		
		if (MIS_Thorben_GetBlessings == LOG_RUNNING)
		{
			B_LogEntry (TOPIC_Thorben,"Daron, Mag Ognia, nie udzieli� mi b�ogos�awie�stwa. Chyba powinienem przekaza� troch� z�ota na potrzeby klasztoru.");
		};
	}
	else //Gold >= 10
	{
		if (Npc_HasItems (other, ItMi_Gold) < 50)
		{
			AI_Output (self, other,"DIA_Daron_Spenden_10_04");//No c�, bogaczem to ty nie jeste�, ale nie nale�ysz te� do biedak�w. 10 sztuk z�ota w zupe�no�ci wystarczy - �yjemy skromnie.
			B_GiveInvItems (other, self, ItMi_Gold, 10);
			
		}
		else if (Npc_HasItems (other, ItMi_Gold) < 100)
		{
			AI_Output (self, other,"DIA_Daron_Spenden_10_05");//Masz ponad 50 monet. Oddaj 25 Innosowi, a otrzymasz jego b�ogos�awie�stwo.
			B_GiveInvItems (other, self, ItMi_Gold, 25);
		}
		else
		{
			AI_Output (self, other,"DIA_Daron_Spenden_10_06");//Masz ponad 100 sztuk z�ota - nasz Pan powiada: dzielcie si�, je�li macie czym.
			AI_Output (self, other,"DIA_Daron_Spenden_10_07");//Ko�ci� przyjmuje twoj� jak�e hojn� ofiar�.
			B_GiveInvItems (other, self, ItMi_Gold, 50);
			
		};
		
		AI_Output (self, other,"DIA_Daron_Spenden_10_08");//B�ogos�awi� ci� w imieniu Innosa. Albowiem on jest �wiat�em i sprawiedliwo�ci�.
		Daron_Segen = TRUE;
		B_GivePlayerXP (XP_InnosSegen);
		
		if (MIS_Thorben_GetBlessings == LOG_RUNNING)
		{
			B_LogEntry (TOPIC_Thorben,"Daron, Mag Ognia, udzieli� mi b�ogos�awie�stwa.");
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
	description	= "Sk�d pochodzisz?";
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
	AI_Output (other, self,"DIA_Daron_Woher_15_00");//Sk�d pochodzisz?
	AI_Output (self, other,"DIA_Daron_Woher_10_01");//Pochodz� z klasztoru mag�w le��cego w g�rach.
	
	if (other.guild == GIL_NONE)
	{
		AI_Output (self, other,"DIA_Daron_Woher_10_02");//Przyjmujemy w swoje szeregi ka�dego, kto ma czyste serce i jest got�w po�wi�ci� �ycie s�u�bie wszechpot�nemu Innosowi.
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
	description	= "Opowiedz mi o Innosie.";
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
	AI_Output (other, self,"DIA_Daron_Innos_15_00");//Opowiedz mi o Innosie.
	AI_Output (self, other,"DIA_Daron_Innos_10_01");//Innos, nasz wszechpot�ny w�adca, jest �wiat�em i ogniem.
	AI_Output (self, other,"DIA_Daron_Innos_10_02");//Da� ludziom magi� i prawo, aby byli jego narz�dziami.
	AI_Output (self, other,"DIA_Daron_Innos_10_03");//Dzia�amy w jego imieniu. Wymierzamy sprawiedliwo�� zgodnie z jego wol� i g�osimy jego nauki.
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
	description	= "Powiedz mi co� wi�cej na temat klasztoru.";
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
	AI_Output (other, self,"DIA_Daron_Kloster_15_00");//Powiedz mi co� wi�cej na temat klasztoru.
	AI_Output (self, other,"DIA_Daron_Kloster_10_01");//Nauczamy wszystkich dziedzin magii. Jednak sztuka Mag�w Ognia to co� wi�cej.
	AI_Output (self, other,"DIA_Daron_Kloster_10_02");//Znamy si� r�wnie� na alchemii, potrafimy tworzy� pot�ne runy.
	AI_Output (self, other,"DIA_Daron_Kloster_10_03");//No i jeste�my producentami doskona�ego wina.
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
	description	= "Co robisz w mie�cie?";
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
	AI_Output (other, self,"DIA_Daron_Stadt_15_00");//Co robisz w mie�cie?
	AI_Output (self, other,"DIA_Daron_Stadt_10_01");//Prowadz� dyskusje z paladynami i wspieram obywateli rad� i dobrym s�owem.
	AI_Output (self, other,"DIA_Daron_Stadt_10_02");//Szczeg�lnie w dzisiejszych czasach naszym obowi�zkiem jest pomaga� s�abszym.
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

	description	 = 	"S�ysza�em o pos��ku... Podobno go zgubi�e�!";
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
	AI_Output	(other, self, "DIA_Addon_Daron_GuildHelp_15_00"); //S�ysza�em o pos��ku... Podobno go zgubi�e�!
	AI_Output	(self, other, "DIA_Addon_Daron_GuildHelp_10_01"); //Hmm... Powiedzie� ci o tym mog�a tylko jedna osoba - Mag Wody, Vatras.
	AI_Output	(other, self, "DIA_Addon_Daron_GuildHelp_15_02"); //Na czym polega problem?
	AI_Output	(self, other, "DIA_Addon_Daron_GuildHelp_10_03"); //Z kontynentu wys�ano do klasztoru cenny pos��ek. Niestety, do tej pory tutaj nie dotar�.
	AI_Output	(other, self, "DIA_Addon_Daron_GuildHelp_15_04"); //Statek zosta� napadni�ty?
	AI_Output	(self, other, "DIA_Addon_Daron_GuildHelp_10_05"); //Nie. Pos��ek zosta� bezpiecznie dostarczony do Khorinis, gdzie osobi�cie go odebra�em.
	AI_Output	(self, other, "DIA_Addon_Daron_GuildHelp_10_06"); //Niestety, podczas transportu do klasztoru dosta� si� on w r�ce goblin�w.
	AI_Output	(self, other, "DIA_Addon_Daron_GuildHelp_10_07"); //Nie patrz tak na mnie. Nawet magowie nie s� nieomylni.
	
	MIS_Addon_Vatras_Go2Daron = LOG_SUCCESS;
	MIS_Addon_Daron_GetStatue = LOG_RUNNING;
	
	Info_ClearChoices	(DIA_Addon_Daron_GuildHelp);
	Info_AddChoice	(DIA_Addon_Daron_GuildHelp, "M�wisz, �e maj� go teraz gobliny?", DIA_Addon_Daron_GuildHelp_gobbos );
	Info_AddChoice	(DIA_Addon_Daron_GuildHelp, "Gdzie straci�e� ten pos��ek?", DIA_Addon_Daron_GuildHelp_wo );
	Info_AddChoice	(DIA_Addon_Daron_GuildHelp, "Nie pr�bowa�e� odzyska� pos��ka?", DIA_Addon_Daron_GuildHelp_wiederholen );
};

func void DIA_Addon_Daron_GuildHelp_wiederholen ()
{
	AI_Output			(other, self, "DIA_Addon_Daron_GuildHelp_wiederholen_15_00"); //Nie pr�bowa�e� odzyska� pos��ka?
	AI_Output			(self, other, "DIA_Addon_Daron_GuildHelp_wiederholen_10_01"); //Oczywi�cie, �e pr�bowa�em! Przeszuka�em ca�� okolic� - niestety, bezskutecznie.
};

func void DIA_Addon_Daron_GuildHelp_gobbos ()
{
	AI_Output			(other, self, "DIA_Addon_Daron_GuildHelp_gobbos_15_00"); //M�wisz, �e maj� go teraz gobliny?
	AI_Output			(self, other, "DIA_Addon_Daron_GuildHelp_gobbos_10_01"); //Zabra�y go i zwia�y, gdzie pieprz ro�nie.
	AI_Output			(self, other, "DIA_Addon_Daron_GuildHelp_gobbos_10_02"); //Nie widzia�em ich ju� p�niej - musia�y si� gdzie� ukry�.
};

func void DIA_Addon_Daron_GuildHelp_wo ()
{
	AI_Output			(other, self, "DIA_Addon_Daron_GuildHelp_wo_15_00"); //Gdzie straci�e� ten pos��ek?
	AI_Output			(self, other, "DIA_Addon_Daron_GuildHelp_wo_10_01"); //W pobli�u gospody Orlana. Szed�em w�a�nie do klasztoru i...

	Info_AddChoice	(DIA_Addon_Daron_GuildHelp, "Mam ju� do�� informacji. Znajd� dla ciebie ten pos��ek.", DIA_Addon_Daron_GuildHelp_auftrag );
	Info_AddChoice	(DIA_Addon_Daron_GuildHelp, "Gospoda Orlana? Gdzie j� znajd�?", DIA_Addon_Daron_GuildHelp_woTaverne );
};

func void DIA_Addon_Daron_GuildHelp_woTaverne ()
{
	AI_Output			(other, self, "DIA_Addon_Daron_GuildHelp_woTaverne_15_00"); //Gospoda Orlana? Gdzie j� znajd�?
	AI_Output			(self, other, "DIA_Addon_Daron_GuildHelp_woTaverne_10_01"); //Wychodzisz z miasta g��wn� bram� i idziesz �cie�k�, dop�ki nie napotkasz samotnie stoj�cego domostwa.
	AI_Output			(self, other, "DIA_Addon_Daron_GuildHelp_woTaverne_10_02"); //To w�a�nie gospoda Orlana, 'Martwa Harpia'.
};

func void DIA_Addon_Daron_GuildHelp_auftrag ()
{
	AI_Output			(other, self, "DIA_Addon_Daron_GuildHelp_auftrag_15_00"); //Mam ju� do�� informacji. Znajd� dla ciebie ten pos��ek.
	AI_Output			(self, other, "DIA_Addon_Daron_GuildHelp_auftrag_10_01"); //Niech ci� Innos chroni od niebezpiecze�stw czyhaj�cych poza bramami miejskimi.
	Info_ClearChoices	(DIA_Addon_Daron_GuildHelp);
	
	Log_CreateTopic (TOPIC_Addon_RangerHelpKDF, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_RangerHelpKDF, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_RangerHelpKDF,"Daron zosta� obrabowany przez podst�pne gobliny i straci� cenny pos��ek, kt�ry mia� trafi� do klasztoru. Uwa�a, �e gobliny ukrywaj� si� gdzie� w okolicy gospody 'Martwa Harpia'."); 
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

	description	 = 	"Uda�o mi si� odnale�� tw�j pos��ek.";
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
	AI_Output	(other, self, "DIA_Addon_Daron_FoundStatue_15_00"); //Uda�o mi si� odnale�� tw�j pos��ek.
	AI_Output	(self, other, "DIA_Addon_Daron_FoundStatue_10_01"); //Chwa�a Innosowi!
	AI_Output	(other, self, "DIA_Addon_Daron_FoundStatue_15_02"); //Co z nim teraz zrobisz?
	AI_Output	(self, other, "DIA_Addon_Daron_FoundStatue_10_03"); //Ja? Nic. Mam przez niego tylko same k�opoty.
	AI_Output	(self, other, "DIA_Addon_Daron_FoundStatue_10_04"); //Ty natomiast zaniesiesz go dla mnie do klasztoru.
	if (other.guild == GIL_NONE)
	{
		AI_Output	(self, other, "DIA_Addon_Daron_FoundStatue_10_05"); //Rzecz jasna do �rodka zostaniesz wpuszczony tylko wtedy, gdy poprzysi�gniesz ca�e �ycie wiernie s�u�y� klasztorowi...
		AI_Output	(self, other, "DIA_Addon_Daron_FoundStatue_10_06"); //Jestem jednak pewien, �e pragn�c mi pom�c, zdecydujesz si� na ten krok... Mam racj�?
	};
	AI_Output	(self, other, "DIA_Addon_Daron_FoundStatue_10_07"); //Niech Innos b�dzie z tob�, m�j synu.
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

	description	 = 	"Zanios�em pos��ek do klasztoru.";
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
	AI_Output	(other, self, "DIA_Addon_Daron_ReturnedStatue_15_00"); //Zanios�em pos��ek do klasztoru. Masz problem z g�owy.
	AI_Output	(self, other, "DIA_Addon_Daron_ReturnedStatue_10_01"); //Nareszcie jakie� dobre wie�ci... Niech ci� Innos chroni.
	AI_Output	(self, other, "DIA_Addon_Daron_ReturnedStatue_10_02"); //Przyjmij to jako wyraz mojej wdzi�czno�ci, synu.
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
	description	= "Jestem biedakiem!";
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
	AI_Output (other, self,"DIA_Daron_arm_15_00");//Jestem biedakiem!
	AI_Output (self, other,"DIA_Daron_arm_10_01");//A wi�c nie masz �adnych pieni�dzy. W dzisiejszych czasach cz�sto si� to zdarza. We� to z�oto, na pewno ci si� przyda.
	AI_Output (self, other,"DIA_Daron_arm_10_02");//Rozejrzyj si� za prac�, zobaczysz, �e naprawd� nietrudno jest zarobi�. A kiedy ju� b�dziesz m�g�, z�� ofiar� ko�cio�owi Innosa, aby w ten spos�b mu si� odwdzi�czy�.
	
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
	description	= "Chcia�bym z�o�y� ofiar�...";
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
	
	AI_Output (other, self,"DIA_Daron_Spende_15_00");//Chcia�bym z�o�y� ofiar�...
	
	Info_ClearChoices (DIA_Daron_Spende);
	
	if (Daron_Spende < 1000)
	{
		Info_AddChoice 	(DIA_Daron_Spende,"Ale nie przynios�em do�� z�ota... (POWR�T)",DIA_Daron_Spende_BACK);
		
		Info_AddChoice 	(DIA_Daron_Spende,"(50 sztuk z�ota)",DIA_Daron_Spende_50);
		Info_AddChoice 	(DIA_Daron_Spende,"(100 sztuk z�ota)",DIA_Daron_Spende_100);
		Info_AddChoice 	(DIA_Daron_Spende,"(200 sztuk z�ota)",DIA_Daron_Spende_200);
	 }
	 else 
	 {
	 	AI_Output (self, other,"DIA_Daron_Spende_10_01");//W sumie otrzyma�em od ciebie ponad 1000 sztuk z�ota.
	 	AI_Output (self, other,"DIA_Daron_Spende_10_02");//B�ogos�awie�stwo Innosa b�dzie ci zawsze towarzyszy�.
	 	
	 	DIA_Daron_Spende_permanent = TRUE;	
		B_DaronSegen ();
	 };
};
FUNC VOID DIA_Daron_Spende_BACK()
{
	AI_Output (other, self,"DIA_Daron_Spende_BACK_15_00"); //Nie mam przy sobie wystarczaj�co du�o z�ota...
	AI_Output (self, other,"DIA_Daron_Spende_BACK_10_01"); //To nie ma znaczenia, synu. Mo�esz z�o�y� ofiar� p�niej.
	
	Info_ClearChoices (DIA_Daron_Spende);
};	
//----------------------------
var int Daron_Spende;
//----------------------------
FUNC VOID DIA_Daron_Spende_50()
{
	if B_GiveInvItems (other, self, ItMi_Gold, 50)
	{
		AI_Output (self, other,"DIA_Daron_Spende_50_10_00");//B�ogos�awi� ci� w imieniu Innosa. Albowiem on jest �wiat�em i sprawiedliwo�ci�.
		Daron_Spende = (Daron_Spende + 50);
		B_DaronSegen ();
		Daron_Segen = TRUE;
		if (MIS_Thorben_GetBlessings == LOG_RUNNING)
		{
			B_LogEntry (TOPIC_Thorben,"Daron, Mag Ognia, udzieli� mi b�ogos�awie�stwa.");
		};
	}
	else
	{
		AI_Output (self, other,"DIA_Daron_Spende_50_10_01");//Je�li masz przy sobie z�oto, mo�esz z�o�y� ofiar� w ka�dej chwili.
	};
	Info_ClearChoices (DIA_Daron_Spende);
};
FUNC VOID DIA_Daron_Spende_100()
{
	if B_GiveInvItems (other, self, ItMi_Gold, 100)
	{
		AI_Output (self, other,"DIA_Daron_Spende_100_10_00");//Innosie, jeste� blaskiem o�wietlaj�cym �cie�ki sprawiedliwych.
		AI_Output (self, other,"DIA_Daron_Spende_100_10_01");//W twoim imieniu b�ogos�awi� tego cz�owieka. Niechaj twoje �wiat�o zawsze wskazuje mu w�a�ciw� drog�.
		Daron_Spende = (Daron_Spende + 100);
		B_DaronSegen ();
		Daron_Segen = TRUE;
		if (MIS_Thorben_GetBlessings == LOG_RUNNING)
		{
			B_LogEntry (TOPIC_Thorben,"Daron, Mag Ognia, udzieli� mi b�ogos�awie�stwa.");
		};
	}
	else
	{
		AI_Output (self, other,"DIA_Daron_Spende_100_10_02");//Nasz pan powiada: je�li chcesz si� modli�, otw�rz swego ducha i serce. Je�li chcesz z�o�y� ofiar�, otw�rz sakiewk�.
	};
	Info_ClearChoices (DIA_Daron_Spende);
};
FUNC VOID DIA_Daron_Spende_200()
{
	if B_GiveInvItems (other, self, ItMi_Gold, 200)
	{
		AI_Output (self, other,"DIA_Daron_Spende_200_10_00");//Innosie, pob�ogos�aw tego m�czyzn�. Niechaj tw�j blask zawsze o�wietla mu drog�.
		AI_Output (self, other,"DIA_Daron_Spende_200_10_01");//Daj mu si��, aby m�g� zawsze post�powa� m�drze i sprawiedliwie.
		Daron_Spende = (Daron_Spende + 200);
		B_DaronSegen ();
		Daron_Segen = TRUE;
		if (MIS_Thorben_GetBlessings == LOG_RUNNING)
		{
			B_LogEntry (TOPIC_Thorben,"Daron, Mag Ognia, udzieli� mi b�ogos�awie�stwa.");
		};
	}
	else
	{
		AI_Output (self, other,"DIA_Daron_Spende_200_10_02");//Je�li chcesz nam przekaza� tyle z�ota, powiniene� je ze sob� przynie��.
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











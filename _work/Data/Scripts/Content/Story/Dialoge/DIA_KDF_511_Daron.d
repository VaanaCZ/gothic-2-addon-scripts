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
	AI_Output (self, other,"DIA_Daron_Hallo_10_00");//Co mogę dla ciebie zrobić? Szukasz duchowego wsparcia?
	AI_Output (self, other,"DIA_Daron_Hallo_10_01");//Pragniesz skierować modlitwę do Innosa, czy też chcesz złożyć niewielką ofiarę w złocie dla naszego kościoła?
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
	description = "Muszę porozmawiać z paladynami...";
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
	AI_Output (other, self,"DIA_Daron_Paladine_15_00");//Muszę porozmawiać z paladynami. Czy pomożesz mi skontaktować się z nimi?
	AI_Output (self, other,"DIA_Daron_Paladine_10_01");//Musisz dostać się do górnego miasta. Jednak wstęp do niego zarezerwowany jest dla obywateli i straży miejskiej.
	AI_Output (self, other,"DIA_Daron_Paladine_10_02");//No i oczywiście dla nas, Magów Ognia.
	AI_Output (other, self,"DIA_Daron_Paladine_15_03");//Jak mogę zostać Magiem Ognia?
	AI_Output (self, other,"DIA_Daron_Paladine_10_04");//Musisz wstąpić do naszego zakonu jako nowicjusz. Niewykluczone, że po jakimś czasie zostaniesz przyjęty do kręgu magów.
	AI_Output (self, other,"DIA_Daron_Paladine_10_05");//Jednak ścieżka prowadząca do tego celu jest długa, kręta i pełna wybojów.
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
	description = "Przyszedłem po błogosławieństwo!";
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
	AI_Output (other, self,"DIA_Daron_AboutSegen_15_00"); //Przyszedłem po błogosławieństwo!
	AI_Output (self, other,"DIA_Daron_AboutSegen_10_01"); //To dobrze, to bardzo dobrze - z pewnością zechcesz zasilić święty kościół Innosa jakąś skromną sumką?
	AI_Output (other, self,"DIA_Daron_AboutSegen_15_02"); //Właściwie to potrzebuję twojego błogosławieństwa, żeby zostać czeladnikiem w dolnej części miasta...
	if (Daron_Segen == TRUE)
	{
		AI_Output (self, other,"DIA_Daron_AboutSegen_10_03"); //Już dostałeś moje błogosławieństwo, synu.
		AI_Output (self, other,"DIA_Daron_AboutSegen_10_04"); //Niech cię Innos prowadzi, synu!
	}
	else
	{
		AI_Output (self, other,"DIA_Daron_AboutSegen_10_05"); //Ależ synu! Bez skromnej ofiary nie będę cię mógł pobłogosławić!
		AI_Output (self, other,"DIA_Daron_AboutSegen_10_06"); //Jak inaczej mógłbym się upewnić co do twoich dobrych intencji wobec najświętszego kościoła Innosa?
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
	description	= "Ile wynosi przeciętna ofiara?";
};                       
FUNC INT DIA_Daron_Spenden_Condition()
{	if (hero.guild != GIL_KDF)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Daron_Spenden_Info()
{	
	AI_Output (other, self,"DIA_Daron_Spenden_15_00");//Ile wynosi przeciętna ofiara?
	AI_Output (self, other,"DIA_Daron_Spenden_10_01");//To zależy od twojego stanu majątkowego. Zobaczmy, ile przyniosłeś.
	AI_Output (self, other,"DIA_Daron_Spenden_10_02");//Mmmm hmmm...
	
	if (Npc_HasItems (other, ItMi_Gold) < 10)
	{
		AI_Output (self, other,"DIA_Daron_Spenden_10_03");//Nie należysz do bogaczy, co? Zostaw sobie te parę monet.
		
		if (MIS_Thorben_GetBlessings == LOG_RUNNING)
		{
			B_LogEntry (TOPIC_Thorben,"Daron, Mag Ognia, nie udzielił mi błogosławieństwa. Chyba powinienem przekazać trochę złota na potrzeby klasztoru.");
		};
	}
	else //Gold >= 10
	{
		if (Npc_HasItems (other, ItMi_Gold) < 50)
		{
			AI_Output (self, other,"DIA_Daron_Spenden_10_04");//No cóż, bogaczem to ty nie jesteś, ale nie należysz też do biedaków. 10 sztuk złota w zupełności wystarczy - żyjemy skromnie.
			B_GiveInvItems (other, self, ItMi_Gold, 10);
			
		}
		else if (Npc_HasItems (other, ItMi_Gold) < 100)
		{
			AI_Output (self, other,"DIA_Daron_Spenden_10_05");//Masz ponad 50 monet. Oddaj 25 Innosowi, a otrzymasz jego błogosławieństwo.
			B_GiveInvItems (other, self, ItMi_Gold, 25);
		}
		else
		{
			AI_Output (self, other,"DIA_Daron_Spenden_10_06");//Masz ponad 100 sztuk złota - nasz Pan powiada: dzielcie się, jeśli macie czym.
			AI_Output (self, other,"DIA_Daron_Spenden_10_07");//Kościół przyjmuje twoją jakże hojną ofiarę.
			B_GiveInvItems (other, self, ItMi_Gold, 50);
			
		};
		
		AI_Output (self, other,"DIA_Daron_Spenden_10_08");//Błogosławię cię w imieniu Innosa. Albowiem on jest światłem i sprawiedliwością.
		Daron_Segen = TRUE;
		B_GivePlayerXP (XP_InnosSegen);
		
		if (MIS_Thorben_GetBlessings == LOG_RUNNING)
		{
			B_LogEntry (TOPIC_Thorben,"Daron, Mag Ognia, udzielił mi błogosławieństwa.");
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
	description	= "Skąd pochodzisz?";
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
	AI_Output (other, self,"DIA_Daron_Woher_15_00");//Skąd pochodzisz?
	AI_Output (self, other,"DIA_Daron_Woher_10_01");//Pochodzę z klasztoru magów leżącego w górach.
	
	if (other.guild == GIL_NONE)
	{
		AI_Output (self, other,"DIA_Daron_Woher_10_02");//Przyjmujemy w swoje szeregi każdego, kto ma czyste serce i jest gotów poświęcić życie służbie wszechpotężnemu Innosowi.
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
	AI_Output (self, other,"DIA_Daron_Innos_10_01");//Innos, nasz wszechpotężny władca, jest światłem i ogniem.
	AI_Output (self, other,"DIA_Daron_Innos_10_02");//Dał ludziom magię i prawo, aby byli jego narzędziami.
	AI_Output (self, other,"DIA_Daron_Innos_10_03");//Działamy w jego imieniu. Wymierzamy sprawiedliwość zgodnie z jego wolą i głosimy jego nauki.
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
	description	= "Powiedz mi coś więcej na temat klasztoru.";
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
	AI_Output (other, self,"DIA_Daron_Kloster_15_00");//Powiedz mi coś więcej na temat klasztoru.
	AI_Output (self, other,"DIA_Daron_Kloster_10_01");//Nauczamy wszystkich dziedzin magii. Jednak sztuka Magów Ognia to coś więcej.
	AI_Output (self, other,"DIA_Daron_Kloster_10_02");//Znamy się również na alchemii, potrafimy tworzyć potężne runy.
	AI_Output (self, other,"DIA_Daron_Kloster_10_03");//No i jesteśmy producentami doskonałego wina.
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
	description	= "Co robisz w mieście?";
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
	AI_Output (other, self,"DIA_Daron_Stadt_15_00");//Co robisz w mieście?
	AI_Output (self, other,"DIA_Daron_Stadt_10_01");//Prowadzę dyskusje z paladynami i wspieram obywateli radą i dobrym słowem.
	AI_Output (self, other,"DIA_Daron_Stadt_10_02");//Szczególnie w dzisiejszych czasach naszym obowiązkiem jest pomagać słabszym.
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

	description	 = 	"Słyszałem o posążku... Podobno go zgubiłeś!";
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
	AI_Output	(other, self, "DIA_Addon_Daron_GuildHelp_15_00"); //Słyszałem o posążku... Podobno go zgubiłeś!
	AI_Output	(self, other, "DIA_Addon_Daron_GuildHelp_10_01"); //Hmm... Powiedzieć ci o tym mogła tylko jedna osoba - Mag Wody, Vatras.
	AI_Output	(other, self, "DIA_Addon_Daron_GuildHelp_15_02"); //Na czym polega problem?
	AI_Output	(self, other, "DIA_Addon_Daron_GuildHelp_10_03"); //Z kontynentu wysłano do klasztoru cenny posążek. Niestety, do tej pory tutaj nie dotarł.
	AI_Output	(other, self, "DIA_Addon_Daron_GuildHelp_15_04"); //Statek został napadnięty?
	AI_Output	(self, other, "DIA_Addon_Daron_GuildHelp_10_05"); //Nie. Posążek został bezpiecznie dostarczony do Khorinis, gdzie osobiście go odebrałem.
	AI_Output	(self, other, "DIA_Addon_Daron_GuildHelp_10_06"); //Niestety, podczas transportu do klasztoru dostał się on w ręce goblinów.
	AI_Output	(self, other, "DIA_Addon_Daron_GuildHelp_10_07"); //Nie patrz tak na mnie. Nawet magowie nie są nieomylni.
	
	MIS_Addon_Vatras_Go2Daron = LOG_SUCCESS;
	MIS_Addon_Daron_GetStatue = LOG_RUNNING;
	
	Info_ClearChoices	(DIA_Addon_Daron_GuildHelp);
	Info_AddChoice	(DIA_Addon_Daron_GuildHelp, "Mówisz, że mają go teraz gobliny?", DIA_Addon_Daron_GuildHelp_gobbos );
	Info_AddChoice	(DIA_Addon_Daron_GuildHelp, "Gdzie straciłeś ten posążek?", DIA_Addon_Daron_GuildHelp_wo );
	Info_AddChoice	(DIA_Addon_Daron_GuildHelp, "Nie próbowałeś odzyskać posążka?", DIA_Addon_Daron_GuildHelp_wiederholen );
};

func void DIA_Addon_Daron_GuildHelp_wiederholen ()
{
	AI_Output			(other, self, "DIA_Addon_Daron_GuildHelp_wiederholen_15_00"); //Nie próbowałeś odzyskać posążka?
	AI_Output			(self, other, "DIA_Addon_Daron_GuildHelp_wiederholen_10_01"); //Oczywiście, że próbowałem! Przeszukałem całą okolicę - niestety, bezskutecznie.
};

func void DIA_Addon_Daron_GuildHelp_gobbos ()
{
	AI_Output			(other, self, "DIA_Addon_Daron_GuildHelp_gobbos_15_00"); //Mówisz, że mają go teraz gobliny?
	AI_Output			(self, other, "DIA_Addon_Daron_GuildHelp_gobbos_10_01"); //Zabrały go i zwiały, gdzie pieprz rośnie.
	AI_Output			(self, other, "DIA_Addon_Daron_GuildHelp_gobbos_10_02"); //Nie widziałem ich już później - musiały się gdzieś ukryć.
};

func void DIA_Addon_Daron_GuildHelp_wo ()
{
	AI_Output			(other, self, "DIA_Addon_Daron_GuildHelp_wo_15_00"); //Gdzie straciłeś ten posążek?
	AI_Output			(self, other, "DIA_Addon_Daron_GuildHelp_wo_10_01"); //W pobliżu gospody Orlana. Szedłem właśnie do klasztoru i...

	Info_AddChoice	(DIA_Addon_Daron_GuildHelp, "Mam już dość informacji. Znajdę dla ciebie ten posążek.", DIA_Addon_Daron_GuildHelp_auftrag );
	Info_AddChoice	(DIA_Addon_Daron_GuildHelp, "Gospoda Orlana? Gdzie ją znajdę?", DIA_Addon_Daron_GuildHelp_woTaverne );
};

func void DIA_Addon_Daron_GuildHelp_woTaverne ()
{
	AI_Output			(other, self, "DIA_Addon_Daron_GuildHelp_woTaverne_15_00"); //Gospoda Orlana? Gdzie ją znajdę?
	AI_Output			(self, other, "DIA_Addon_Daron_GuildHelp_woTaverne_10_01"); //Wychodzisz z miasta główną bramą i idziesz ścieżką, dopóki nie napotkasz samotnie stojącego domostwa.
	AI_Output			(self, other, "DIA_Addon_Daron_GuildHelp_woTaverne_10_02"); //To właśnie gospoda Orlana, 'Martwa Harpia'.
};

func void DIA_Addon_Daron_GuildHelp_auftrag ()
{
	AI_Output			(other, self, "DIA_Addon_Daron_GuildHelp_auftrag_15_00"); //Mam już dość informacji. Znajdę dla ciebie ten posążek.
	AI_Output			(self, other, "DIA_Addon_Daron_GuildHelp_auftrag_10_01"); //Niech cię Innos chroni od niebezpieczeństw czyhających poza bramami miejskimi.
	Info_ClearChoices	(DIA_Addon_Daron_GuildHelp);
	
	Log_CreateTopic (TOPIC_Addon_RangerHelpKDF, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_RangerHelpKDF, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_RangerHelpKDF,"Daron został obrabowany przez podstępne gobliny i stracił cenny posążek, który miał trafić do klasztoru. Uważa, że gobliny ukrywają się gdzieś w okolicy gospody 'Martwa Harpia'."); 
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

	description	 = 	"Udało mi się odnaleźć twój posążek.";
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
	AI_Output	(other, self, "DIA_Addon_Daron_FoundStatue_15_00"); //Udało mi się odnaleźć twój posążek.
	AI_Output	(self, other, "DIA_Addon_Daron_FoundStatue_10_01"); //Chwała Innosowi!
	AI_Output	(other, self, "DIA_Addon_Daron_FoundStatue_15_02"); //Co z nim teraz zrobisz?
	AI_Output	(self, other, "DIA_Addon_Daron_FoundStatue_10_03"); //Ja? Nic. Mam przez niego tylko same kłopoty.
	AI_Output	(self, other, "DIA_Addon_Daron_FoundStatue_10_04"); //Ty natomiast zaniesiesz go dla mnie do klasztoru.
	if (other.guild == GIL_NONE)
	{
		AI_Output	(self, other, "DIA_Addon_Daron_FoundStatue_10_05"); //Rzecz jasna do środka zostaniesz wpuszczony tylko wtedy, gdy poprzysięgniesz całe życie wiernie służyć klasztorowi...
		AI_Output	(self, other, "DIA_Addon_Daron_FoundStatue_10_06"); //Jestem jednak pewien, że pragnąc mi pomóc, zdecydujesz się na ten krok... Mam rację?
	};
	AI_Output	(self, other, "DIA_Addon_Daron_FoundStatue_10_07"); //Niech Innos będzie z tobą, mój synu.
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

	description	 = 	"Zaniosłem posążek do klasztoru.";
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
	AI_Output	(other, self, "DIA_Addon_Daron_ReturnedStatue_15_00"); //Zaniosłem posążek do klasztoru. Masz problem z głowy.
	AI_Output	(self, other, "DIA_Addon_Daron_ReturnedStatue_10_01"); //Nareszcie jakieś dobre wieści... Niech cię Innos chroni.
	AI_Output	(self, other, "DIA_Addon_Daron_ReturnedStatue_10_02"); //Przyjmij to jako wyraz mojej wdzięczności, synu.
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
	AI_Output (self, other,"DIA_Daron_arm_10_01");//A więc nie masz żadnych pieniędzy. W dzisiejszych czasach często się to zdarza. Weź to złoto, na pewno ci się przyda.
	AI_Output (self, other,"DIA_Daron_arm_10_02");//Rozejrzyj się za pracą, zobaczysz, że naprawdę nietrudno jest zarobić. A kiedy już będziesz mógł, złóż ofiarę kościołowi Innosa, aby w ten sposób mu się odwdzięczyć.
	
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
	description	= "Chciałbym złożyć ofiarę...";
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
	
	AI_Output (other, self,"DIA_Daron_Spende_15_00");//Chciałbym złożyć ofiarę...
	
	Info_ClearChoices (DIA_Daron_Spende);
	
	if (Daron_Spende < 1000)
	{
		Info_AddChoice 	(DIA_Daron_Spende,"Ale nie przyniosłem dość złota... (POWRÓT)",DIA_Daron_Spende_BACK);
		
		Info_AddChoice 	(DIA_Daron_Spende,"(50 sztuk złota)",DIA_Daron_Spende_50);
		Info_AddChoice 	(DIA_Daron_Spende,"(100 sztuk złota)",DIA_Daron_Spende_100);
		Info_AddChoice 	(DIA_Daron_Spende,"(200 sztuk złota)",DIA_Daron_Spende_200);
	 }
	 else 
	 {
	 	AI_Output (self, other,"DIA_Daron_Spende_10_01");//W sumie otrzymałem od ciebie ponad 1000 sztuk złota.
	 	AI_Output (self, other,"DIA_Daron_Spende_10_02");//Błogosławieństwo Innosa będzie ci zawsze towarzyszyć.
	 	
	 	DIA_Daron_Spende_permanent = TRUE;	
		B_DaronSegen ();
	 };
};
FUNC VOID DIA_Daron_Spende_BACK()
{
	AI_Output (other, self,"DIA_Daron_Spende_BACK_15_00"); //Nie mam przy sobie wystarczająco dużo złota...
	AI_Output (self, other,"DIA_Daron_Spende_BACK_10_01"); //To nie ma znaczenia, synu. Możesz złożyć ofiarę później.
	
	Info_ClearChoices (DIA_Daron_Spende);
};	
//----------------------------
var int Daron_Spende;
//----------------------------
FUNC VOID DIA_Daron_Spende_50()
{
	if B_GiveInvItems (other, self, ItMi_Gold, 50)
	{
		AI_Output (self, other,"DIA_Daron_Spende_50_10_00");//Błogosławię cię w imieniu Innosa. Albowiem on jest światłem i sprawiedliwością.
		Daron_Spende = (Daron_Spende + 50);
		B_DaronSegen ();
		Daron_Segen = TRUE;
		if (MIS_Thorben_GetBlessings == LOG_RUNNING)
		{
			B_LogEntry (TOPIC_Thorben,"Daron, Mag Ognia, udzielił mi błogosławieństwa.");
		};
	}
	else
	{
		AI_Output (self, other,"DIA_Daron_Spende_50_10_01");//Jeśli masz przy sobie złoto, możesz złożyć ofiarę w każdej chwili.
	};
	Info_ClearChoices (DIA_Daron_Spende);
};
FUNC VOID DIA_Daron_Spende_100()
{
	if B_GiveInvItems (other, self, ItMi_Gold, 100)
	{
		AI_Output (self, other,"DIA_Daron_Spende_100_10_00");//Innosie, jesteś blaskiem oświetlającym ścieżki sprawiedliwych.
		AI_Output (self, other,"DIA_Daron_Spende_100_10_01");//W twoim imieniu błogosławię tego człowieka. Niechaj twoje światło zawsze wskazuje mu właściwą drogę.
		Daron_Spende = (Daron_Spende + 100);
		B_DaronSegen ();
		Daron_Segen = TRUE;
		if (MIS_Thorben_GetBlessings == LOG_RUNNING)
		{
			B_LogEntry (TOPIC_Thorben,"Daron, Mag Ognia, udzielił mi błogosławieństwa.");
		};
	}
	else
	{
		AI_Output (self, other,"DIA_Daron_Spende_100_10_02");//Nasz pan powiada: jeśli chcesz się modlić, otwórz swego ducha i serce. Jeśli chcesz złożyć ofiarę, otwórz sakiewkę.
	};
	Info_ClearChoices (DIA_Daron_Spende);
};
FUNC VOID DIA_Daron_Spende_200()
{
	if B_GiveInvItems (other, self, ItMi_Gold, 200)
	{
		AI_Output (self, other,"DIA_Daron_Spende_200_10_00");//Innosie, pobłogosław tego mężczyznę. Niechaj twój blask zawsze oświetla mu drogę.
		AI_Output (self, other,"DIA_Daron_Spende_200_10_01");//Daj mu siłę, aby mógł zawsze postępować mądrze i sprawiedliwie.
		Daron_Spende = (Daron_Spende + 200);
		B_DaronSegen ();
		Daron_Segen = TRUE;
		if (MIS_Thorben_GetBlessings == LOG_RUNNING)
		{
			B_LogEntry (TOPIC_Thorben,"Daron, Mag Ognia, udzielił mi błogosławieństwa.");
		};
	}
	else
	{
		AI_Output (self, other,"DIA_Daron_Spende_200_10_02");//Jeśli chcesz nam przekazać tyle złota, powinieneś je ze sobą przynieść.
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











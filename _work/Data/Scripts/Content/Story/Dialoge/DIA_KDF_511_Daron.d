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
	AI_Output (self, other,"DIA_Daron_Hallo_10_00");//Co mogê dla ciebie zrobiæ? Szukasz duchowego wsparcia?
	AI_Output (self, other,"DIA_Daron_Hallo_10_01");//Pragniesz skierowaæ modlitwê do Innosa, czy te¿ chcesz z³o¿yæ niewielk¹ ofiarê w z³ocie dla naszego koœcio³a?
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
	description = "Muszê porozmawiaæ z paladynami...";
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
	AI_Output (other, self,"DIA_Daron_Paladine_15_00");//Muszê porozmawiaæ z paladynami. Czy pomo¿esz mi skontaktowaæ siê z nimi?
	AI_Output (self, other,"DIA_Daron_Paladine_10_01");//Musisz dostaæ siê do górnego miasta. Jednak wstêp do niego zarezerwowany jest dla obywateli i stra¿y miejskiej.
	AI_Output (self, other,"DIA_Daron_Paladine_10_02");//No i oczywiœcie dla nas, Magów Ognia.
	AI_Output (other, self,"DIA_Daron_Paladine_15_03");//Jak mogê zostaæ Magiem Ognia?
	AI_Output (self, other,"DIA_Daron_Paladine_10_04");//Musisz wst¹piæ do naszego zakonu jako nowicjusz. Niewykluczone, ¿e po jakimœ czasie zostaniesz przyjêty do krêgu magów.
	AI_Output (self, other,"DIA_Daron_Paladine_10_05");//Jednak œcie¿ka prowadz¹ca do tego celu jest d³uga, krêta i pe³na wybojów.
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
	description = "Przyszed³em po b³ogos³awieñstwo!";
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
	AI_Output (other, self,"DIA_Daron_AboutSegen_15_00"); //Przyszed³em po b³ogos³awieñstwo!
	AI_Output (self, other,"DIA_Daron_AboutSegen_10_01"); //To dobrze, to bardzo dobrze - z pewnoœci¹ zechcesz zasiliæ œwiêty koœció³ Innosa jak¹œ skromn¹ sumk¹?
	AI_Output (other, self,"DIA_Daron_AboutSegen_15_02"); //W³aœciwie to potrzebujê twojego b³ogos³awieñstwa, ¿eby zostaæ czeladnikiem w dolnej czêœci miasta...
	if (Daron_Segen == TRUE)
	{
		AI_Output (self, other,"DIA_Daron_AboutSegen_10_03"); //Ju¿ dosta³eœ moje b³ogos³awieñstwo, synu.
		AI_Output (self, other,"DIA_Daron_AboutSegen_10_04"); //Niech ciê Innos prowadzi, synu!
	}
	else
	{
		AI_Output (self, other,"DIA_Daron_AboutSegen_10_05"); //Ale¿ synu! Bez skromnej ofiary nie bêdê ciê móg³ pob³ogos³awiæ!
		AI_Output (self, other,"DIA_Daron_AboutSegen_10_06"); //Jak inaczej móg³bym siê upewniæ co do twoich dobrych intencji wobec najœwiêtszego koœcio³a Innosa?
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
	description	= "Ile wynosi przeciêtna ofiara?";
};                       
FUNC INT DIA_Daron_Spenden_Condition()
{	if (hero.guild != GIL_KDF)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Daron_Spenden_Info()
{	
	AI_Output (other, self,"DIA_Daron_Spenden_15_00");//Ile wynosi przeciêtna ofiara?
	AI_Output (self, other,"DIA_Daron_Spenden_10_01");//To zale¿y od twojego stanu maj¹tkowego. Zobaczmy, ile przynios³eœ.
	AI_Output (self, other,"DIA_Daron_Spenden_10_02");//Mmmm hmmm...
	
	if (Npc_HasItems (other, ItMi_Gold) < 10)
	{
		AI_Output (self, other,"DIA_Daron_Spenden_10_03");//Nie nale¿ysz do bogaczy, co? Zostaw sobie te parê monet.
		
		if (MIS_Thorben_GetBlessings == LOG_RUNNING)
		{
			B_LogEntry (TOPIC_Thorben,"Daron, Mag Ognia, nie udzieli³ mi b³ogos³awieñstwa. Chyba powinienem przekazaæ trochê z³ota na potrzeby klasztoru.");
		};
	}
	else //Gold >= 10
	{
		if (Npc_HasItems (other, ItMi_Gold) < 50)
		{
			AI_Output (self, other,"DIA_Daron_Spenden_10_04");//No có¿, bogaczem to ty nie jesteœ, ale nie nale¿ysz te¿ do biedaków. 10 sztuk z³ota w zupe³noœci wystarczy - ¿yjemy skromnie.
			B_GiveInvItems (other, self, ItMi_Gold, 10);
			
		}
		else if (Npc_HasItems (other, ItMi_Gold) < 100)
		{
			AI_Output (self, other,"DIA_Daron_Spenden_10_05");//Masz ponad 50 monet. Oddaj 25 Innosowi, a otrzymasz jego b³ogos³awieñstwo.
			B_GiveInvItems (other, self, ItMi_Gold, 25);
		}
		else
		{
			AI_Output (self, other,"DIA_Daron_Spenden_10_06");//Masz ponad 100 sztuk z³ota - nasz Pan powiada: dzielcie siê, jeœli macie czym.
			AI_Output (self, other,"DIA_Daron_Spenden_10_07");//Koœció³ przyjmuje twoj¹ jak¿e hojn¹ ofiarê.
			B_GiveInvItems (other, self, ItMi_Gold, 50);
			
		};
		
		AI_Output (self, other,"DIA_Daron_Spenden_10_08");//B³ogos³awiê ciê w imieniu Innosa. Albowiem on jest œwiat³em i sprawiedliwoœci¹.
		Daron_Segen = TRUE;
		B_GivePlayerXP (XP_InnosSegen);
		
		if (MIS_Thorben_GetBlessings == LOG_RUNNING)
		{
			B_LogEntry (TOPIC_Thorben,"Daron, Mag Ognia, udzieli³ mi b³ogos³awieñstwa.");
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
	description	= "Sk¹d pochodzisz?";
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
	AI_Output (other, self,"DIA_Daron_Woher_15_00");//Sk¹d pochodzisz?
	AI_Output (self, other,"DIA_Daron_Woher_10_01");//Pochodzê z klasztoru magów le¿¹cego w górach.
	
	if (other.guild == GIL_NONE)
	{
		AI_Output (self, other,"DIA_Daron_Woher_10_02");//Przyjmujemy w swoje szeregi ka¿dego, kto ma czyste serce i jest gotów poœwiêciæ ¿ycie s³u¿bie wszechpotê¿nemu Innosowi.
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
	AI_Output (self, other,"DIA_Daron_Innos_10_01");//Innos, nasz wszechpotê¿ny w³adca, jest œwiat³em i ogniem.
	AI_Output (self, other,"DIA_Daron_Innos_10_02");//Da³ ludziom magiê i prawo, aby byli jego narzêdziami.
	AI_Output (self, other,"DIA_Daron_Innos_10_03");//Dzia³amy w jego imieniu. Wymierzamy sprawiedliwoœæ zgodnie z jego wol¹ i g³osimy jego nauki.
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
	description	= "Powiedz mi coœ wiêcej na temat klasztoru.";
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
	AI_Output (other, self,"DIA_Daron_Kloster_15_00");//Powiedz mi coœ wiêcej na temat klasztoru.
	AI_Output (self, other,"DIA_Daron_Kloster_10_01");//Nauczamy wszystkich dziedzin magii. Jednak sztuka Magów Ognia to coœ wiêcej.
	AI_Output (self, other,"DIA_Daron_Kloster_10_02");//Znamy siê równie¿ na alchemii, potrafimy tworzyæ potê¿ne runy.
	AI_Output (self, other,"DIA_Daron_Kloster_10_03");//No i jesteœmy producentami doskona³ego wina.
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
	description	= "Co robisz w mieœcie?";
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
	AI_Output (other, self,"DIA_Daron_Stadt_15_00");//Co robisz w mieœcie?
	AI_Output (self, other,"DIA_Daron_Stadt_10_01");//Prowadzê dyskusje z paladynami i wspieram obywateli rad¹ i dobrym s³owem.
	AI_Output (self, other,"DIA_Daron_Stadt_10_02");//Szczególnie w dzisiejszych czasach naszym obowi¹zkiem jest pomagaæ s³abszym.
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

	description	 = 	"S³ysza³em o pos¹¿ku... Podobno go zgubi³eœ!";
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
	AI_Output	(other, self, "DIA_Addon_Daron_GuildHelp_15_00"); //S³ysza³em o pos¹¿ku... Podobno go zgubi³eœ!
	AI_Output	(self, other, "DIA_Addon_Daron_GuildHelp_10_01"); //Hmm... Powiedzieæ ci o tym mog³a tylko jedna osoba - Mag Wody, Vatras.
	AI_Output	(other, self, "DIA_Addon_Daron_GuildHelp_15_02"); //Na czym polega problem?
	AI_Output	(self, other, "DIA_Addon_Daron_GuildHelp_10_03"); //Z kontynentu wys³ano do klasztoru cenny pos¹¿ek. Niestety, do tej pory tutaj nie dotar³.
	AI_Output	(other, self, "DIA_Addon_Daron_GuildHelp_15_04"); //Statek zosta³ napadniêty?
	AI_Output	(self, other, "DIA_Addon_Daron_GuildHelp_10_05"); //Nie. Pos¹¿ek zosta³ bezpiecznie dostarczony do Khorinis, gdzie osobiœcie go odebra³em.
	AI_Output	(self, other, "DIA_Addon_Daron_GuildHelp_10_06"); //Niestety, podczas transportu do klasztoru dosta³ siê on w rêce goblinów.
	AI_Output	(self, other, "DIA_Addon_Daron_GuildHelp_10_07"); //Nie patrz tak na mnie. Nawet magowie nie s¹ nieomylni.
	
	MIS_Addon_Vatras_Go2Daron = LOG_SUCCESS;
	MIS_Addon_Daron_GetStatue = LOG_RUNNING;
	
	Info_ClearChoices	(DIA_Addon_Daron_GuildHelp);
	Info_AddChoice	(DIA_Addon_Daron_GuildHelp, "Mówisz, ¿e maj¹ go teraz gobliny?", DIA_Addon_Daron_GuildHelp_gobbos );
	Info_AddChoice	(DIA_Addon_Daron_GuildHelp, "Gdzie straci³eœ ten pos¹¿ek?", DIA_Addon_Daron_GuildHelp_wo );
	Info_AddChoice	(DIA_Addon_Daron_GuildHelp, "Nie próbowa³eœ odzyskaæ pos¹¿ka?", DIA_Addon_Daron_GuildHelp_wiederholen );
};

func void DIA_Addon_Daron_GuildHelp_wiederholen ()
{
	AI_Output			(other, self, "DIA_Addon_Daron_GuildHelp_wiederholen_15_00"); //Nie próbowa³eœ odzyskaæ pos¹¿ka?
	AI_Output			(self, other, "DIA_Addon_Daron_GuildHelp_wiederholen_10_01"); //Oczywiœcie, ¿e próbowa³em! Przeszuka³em ca³¹ okolicê - niestety, bezskutecznie.
};

func void DIA_Addon_Daron_GuildHelp_gobbos ()
{
	AI_Output			(other, self, "DIA_Addon_Daron_GuildHelp_gobbos_15_00"); //Mówisz, ¿e maj¹ go teraz gobliny?
	AI_Output			(self, other, "DIA_Addon_Daron_GuildHelp_gobbos_10_01"); //Zabra³y go i zwia³y, gdzie pieprz roœnie.
	AI_Output			(self, other, "DIA_Addon_Daron_GuildHelp_gobbos_10_02"); //Nie widzia³em ich ju¿ póŸniej - musia³y siê gdzieœ ukryæ.
};

func void DIA_Addon_Daron_GuildHelp_wo ()
{
	AI_Output			(other, self, "DIA_Addon_Daron_GuildHelp_wo_15_00"); //Gdzie straci³eœ ten pos¹¿ek?
	AI_Output			(self, other, "DIA_Addon_Daron_GuildHelp_wo_10_01"); //W pobli¿u gospody Orlana. Szed³em w³aœnie do klasztoru i...

	Info_AddChoice	(DIA_Addon_Daron_GuildHelp, "Mam ju¿ doœæ informacji. Znajdê dla ciebie ten pos¹¿ek.", DIA_Addon_Daron_GuildHelp_auftrag );
	Info_AddChoice	(DIA_Addon_Daron_GuildHelp, "Gospoda Orlana? Gdzie j¹ znajdê?", DIA_Addon_Daron_GuildHelp_woTaverne );
};

func void DIA_Addon_Daron_GuildHelp_woTaverne ()
{
	AI_Output			(other, self, "DIA_Addon_Daron_GuildHelp_woTaverne_15_00"); //Gospoda Orlana? Gdzie j¹ znajdê?
	AI_Output			(self, other, "DIA_Addon_Daron_GuildHelp_woTaverne_10_01"); //Wychodzisz z miasta g³ówn¹ bram¹ i idziesz œcie¿k¹, dopóki nie napotkasz samotnie stoj¹cego domostwa.
	AI_Output			(self, other, "DIA_Addon_Daron_GuildHelp_woTaverne_10_02"); //To w³aœnie gospoda Orlana, 'Martwa Harpia'.
};

func void DIA_Addon_Daron_GuildHelp_auftrag ()
{
	AI_Output			(other, self, "DIA_Addon_Daron_GuildHelp_auftrag_15_00"); //Mam ju¿ doœæ informacji. Znajdê dla ciebie ten pos¹¿ek.
	AI_Output			(self, other, "DIA_Addon_Daron_GuildHelp_auftrag_10_01"); //Niech ciê Innos chroni od niebezpieczeñstw czyhaj¹cych poza bramami miejskimi.
	Info_ClearChoices	(DIA_Addon_Daron_GuildHelp);
	
	Log_CreateTopic (TOPIC_Addon_RangerHelpKDF, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_RangerHelpKDF, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_RangerHelpKDF,"Daron zosta³ obrabowany przez podstêpne gobliny i straci³ cenny pos¹¿ek, który mia³ trafiæ do klasztoru. Uwa¿a, ¿e gobliny ukrywaj¹ siê gdzieœ w okolicy gospody 'Martwa Harpia'."); 
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

	description	 = 	"Uda³o mi siê odnaleŸæ twój pos¹¿ek.";
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
	AI_Output	(other, self, "DIA_Addon_Daron_FoundStatue_15_00"); //Uda³o mi siê odnaleŸæ twój pos¹¿ek.
	AI_Output	(self, other, "DIA_Addon_Daron_FoundStatue_10_01"); //Chwa³a Innosowi!
	AI_Output	(other, self, "DIA_Addon_Daron_FoundStatue_15_02"); //Co z nim teraz zrobisz?
	AI_Output	(self, other, "DIA_Addon_Daron_FoundStatue_10_03"); //Ja? Nic. Mam przez niego tylko same k³opoty.
	AI_Output	(self, other, "DIA_Addon_Daron_FoundStatue_10_04"); //Ty natomiast zaniesiesz go dla mnie do klasztoru.
	if (other.guild == GIL_NONE)
	{
		AI_Output	(self, other, "DIA_Addon_Daron_FoundStatue_10_05"); //Rzecz jasna do œrodka zostaniesz wpuszczony tylko wtedy, gdy poprzysiêgniesz ca³e ¿ycie wiernie s³u¿yæ klasztorowi...
		AI_Output	(self, other, "DIA_Addon_Daron_FoundStatue_10_06"); //Jestem jednak pewien, ¿e pragn¹c mi pomóc, zdecydujesz siê na ten krok... Mam racjê?
	};
	AI_Output	(self, other, "DIA_Addon_Daron_FoundStatue_10_07"); //Niech Innos bêdzie z tob¹, mój synu.
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

	description	 = 	"Zanios³em pos¹¿ek do klasztoru.";
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
	AI_Output	(other, self, "DIA_Addon_Daron_ReturnedStatue_15_00"); //Zanios³em pos¹¿ek do klasztoru. Masz problem z g³owy.
	AI_Output	(self, other, "DIA_Addon_Daron_ReturnedStatue_10_01"); //Nareszcie jakieœ dobre wieœci... Niech ciê Innos chroni.
	AI_Output	(self, other, "DIA_Addon_Daron_ReturnedStatue_10_02"); //Przyjmij to jako wyraz mojej wdziêcznoœci, synu.
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
	AI_Output (self, other,"DIA_Daron_arm_10_01");//A wiêc nie masz ¿adnych pieniêdzy. W dzisiejszych czasach czêsto siê to zdarza. WeŸ to z³oto, na pewno ci siê przyda.
	AI_Output (self, other,"DIA_Daron_arm_10_02");//Rozejrzyj siê za prac¹, zobaczysz, ¿e naprawdê nietrudno jest zarobiæ. A kiedy ju¿ bêdziesz móg³, z³ó¿ ofiarê koœcio³owi Innosa, aby w ten sposób mu siê odwdziêczyæ.
	
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
	description	= "Chcia³bym z³o¿yæ ofiarê...";
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
	
	AI_Output (other, self,"DIA_Daron_Spende_15_00");//Chcia³bym z³o¿yæ ofiarê...
	
	Info_ClearChoices (DIA_Daron_Spende);
	
	if (Daron_Spende < 1000)
	{
		Info_AddChoice 	(DIA_Daron_Spende,"Ale nie przynios³em doœæ z³ota... (POWRÓT)",DIA_Daron_Spende_BACK);
		
		Info_AddChoice 	(DIA_Daron_Spende,"(50 sztuk z³ota)",DIA_Daron_Spende_50);
		Info_AddChoice 	(DIA_Daron_Spende,"(100 sztuk z³ota)",DIA_Daron_Spende_100);
		Info_AddChoice 	(DIA_Daron_Spende,"(200 sztuk z³ota)",DIA_Daron_Spende_200);
	 }
	 else 
	 {
	 	AI_Output (self, other,"DIA_Daron_Spende_10_01");//W sumie otrzyma³em od ciebie ponad 1000 sztuk z³ota.
	 	AI_Output (self, other,"DIA_Daron_Spende_10_02");//B³ogos³awieñstwo Innosa bêdzie ci zawsze towarzyszyæ.
	 	
	 	DIA_Daron_Spende_permanent = TRUE;	
		B_DaronSegen ();
	 };
};
FUNC VOID DIA_Daron_Spende_BACK()
{
	AI_Output (other, self,"DIA_Daron_Spende_BACK_15_00"); //Nie mam przy sobie wystarczaj¹co du¿o z³ota...
	AI_Output (self, other,"DIA_Daron_Spende_BACK_10_01"); //To nie ma znaczenia, synu. Mo¿esz z³o¿yæ ofiarê póŸniej.
	
	Info_ClearChoices (DIA_Daron_Spende);
};	
//----------------------------
var int Daron_Spende;
//----------------------------
FUNC VOID DIA_Daron_Spende_50()
{
	if B_GiveInvItems (other, self, ItMi_Gold, 50)
	{
		AI_Output (self, other,"DIA_Daron_Spende_50_10_00");//B³ogos³awiê ciê w imieniu Innosa. Albowiem on jest œwiat³em i sprawiedliwoœci¹.
		Daron_Spende = (Daron_Spende + 50);
		B_DaronSegen ();
		Daron_Segen = TRUE;
		if (MIS_Thorben_GetBlessings == LOG_RUNNING)
		{
			B_LogEntry (TOPIC_Thorben,"Daron, Mag Ognia, udzieli³ mi b³ogos³awieñstwa.");
		};
	}
	else
	{
		AI_Output (self, other,"DIA_Daron_Spende_50_10_01");//Jeœli masz przy sobie z³oto, mo¿esz z³o¿yæ ofiarê w ka¿dej chwili.
	};
	Info_ClearChoices (DIA_Daron_Spende);
};
FUNC VOID DIA_Daron_Spende_100()
{
	if B_GiveInvItems (other, self, ItMi_Gold, 100)
	{
		AI_Output (self, other,"DIA_Daron_Spende_100_10_00");//Innosie, jesteœ blaskiem oœwietlaj¹cym œcie¿ki sprawiedliwych.
		AI_Output (self, other,"DIA_Daron_Spende_100_10_01");//W twoim imieniu b³ogos³awiê tego cz³owieka. Niechaj twoje œwiat³o zawsze wskazuje mu w³aœciw¹ drogê.
		Daron_Spende = (Daron_Spende + 100);
		B_DaronSegen ();
		Daron_Segen = TRUE;
		if (MIS_Thorben_GetBlessings == LOG_RUNNING)
		{
			B_LogEntry (TOPIC_Thorben,"Daron, Mag Ognia, udzieli³ mi b³ogos³awieñstwa.");
		};
	}
	else
	{
		AI_Output (self, other,"DIA_Daron_Spende_100_10_02");//Nasz pan powiada: jeœli chcesz siê modliæ, otwórz swego ducha i serce. Jeœli chcesz z³o¿yæ ofiarê, otwórz sakiewkê.
	};
	Info_ClearChoices (DIA_Daron_Spende);
};
FUNC VOID DIA_Daron_Spende_200()
{
	if B_GiveInvItems (other, self, ItMi_Gold, 200)
	{
		AI_Output (self, other,"DIA_Daron_Spende_200_10_00");//Innosie, pob³ogos³aw tego mê¿czyznê. Niechaj twój blask zawsze oœwietla mu drogê.
		AI_Output (self, other,"DIA_Daron_Spende_200_10_01");//Daj mu si³ê, aby móg³ zawsze postêpowaæ m¹drze i sprawiedliwie.
		Daron_Spende = (Daron_Spende + 200);
		B_DaronSegen ();
		Daron_Segen = TRUE;
		if (MIS_Thorben_GetBlessings == LOG_RUNNING)
		{
			B_LogEntry (TOPIC_Thorben,"Daron, Mag Ognia, udzieli³ mi b³ogos³awieñstwa.");
		};
	}
	else
	{
		AI_Output (self, other,"DIA_Daron_Spende_200_10_02");//Jeœli chcesz nam przekazaæ tyle z³ota, powinieneœ je ze sob¹ przynieœæ.
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











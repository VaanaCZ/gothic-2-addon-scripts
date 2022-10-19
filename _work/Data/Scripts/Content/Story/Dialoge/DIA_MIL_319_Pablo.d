///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Pablo_EXIT   (C_INFO)
{
	npc         = Mil_319_Pablo;
	nr          = 999;
	condition   = DIA_Pablo_EXIT_Condition;
	information = DIA_Pablo_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Pablo_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Pablo_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Pablo_PICKPOCKET (C_INFO)
{
	npc			= Mil_319_Pablo;
	nr			= 900;
	condition	= DIA_Pablo_PICKPOCKET_Condition;
	information	= DIA_Pablo_PICKPOCKET_Info;
	permanent	= TRUE;
	description = "(Kradzie¿ tego klucza bêdzie dziecinnie ³atwa)";
};                       

FUNC INT DIA_Pablo_PICKPOCKET_Condition()
{
	if (Npc_GetTalentSkill (other,NPC_TALENT_PICKPOCKET) == 1) 
	&& (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (Npc_HasItems(self, ItKe_City_Tower_01) >= 1)
	&& (other.attribute[ATR_DEXTERITY] >= (20 - Theftdiff))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Pablo_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Pablo_PICKPOCKET);
	Info_AddChoice		(DIA_Pablo_PICKPOCKET, DIALOG_BACK 		,DIA_Pablo_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Pablo_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Pablo_PICKPOCKET_DoIt);
};

func void DIA_Pablo_PICKPOCKET_DoIt()
{
	if (other.attribute[ATR_DEXTERITY] >= 20)
	{
		B_GiveInvItems (self, other, ItKe_City_Tower_01, 1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP ();
		Info_ClearChoices (DIA_Pablo_PICKPOCKET);
	}
	else
	{
		B_ResetThiefLevel();
		AI_StopProcessInfos	(self);
		B_Attack (self, other, AR_Theft, 1); //reagiert trotz IGNORE_Theft mit NEWS
	};
};
	
func void DIA_Pablo_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Pablo_PICKPOCKET);
};
///////////////////////////////////////////////////////////////////////
//	Info WANTED
///////////////////////////////////////////////////////////////////////
var int Pablo_belogen;
//--------------------

instance DIA_Pablo_WANTED		(C_INFO)
{
	npc			 = 	Mil_319_Pablo;
	nr			 = 	1;
	condition	 = 	DIA_Pablo_WANTED_Condition;
	information	 = 	DIA_Pablo_WANTED_Info;
	important	 = 	TRUE;
};
func int DIA_Pablo_WANTED_Condition ()
{
	if (hero.guild != GIL_MIL)
	&& (hero.guild != GIL_PAL)
	&& (hero.guild != GIL_KDF)
	{
		return TRUE;
	};	
};
func void DIA_Pablo_WANTED_Info ()
{
	AI_Output (self, other, "DIA_Pablo_WANTED_12_00"); //Hej ty, zaczekaj! Chyba gdzieœ ciê ju¿ widzia³em.
	AI_Output (other, self, "DIA_Pablo_WANTED_15_01"); //Czego chcesz?
	AI_Output (self, other, "DIA_Pablo_WANTED_12_02"); //Mówiê przecie¿, ¿e ju¿ ciê gdzieœ widzia³em... a, tak!
	B_UseFakeScroll ();
	AI_Output (self, other, "DIA_Pablo_WANTED_12_03"); //Spójrz - znaleŸliœmy ten portret przy bandytach, na których natknêliœmy siê kilka dni temu - facet wygl¹da zupe³nie jak ty.
	B_GiveInvItems (self, other, ItWr_Poster_MIS,1);
	AI_Output (self, other, "DIA_Pablo_WANTED_12_04"); //Ci kolesie chyba ciê szukali.
	
	
	Info_ClearChoices (DIA_Pablo_WANTED);
	
	Info_AddChoice  (DIA_Pablo_WANTED,"Nie, mylisz siê.",DIA_Pablo_WANTED_NOTHING);
	Info_AddChoice 	(DIA_Pablo_WANTED,"No, no. Sam bym na to nie wpad³.",DIA_Pablo_WANTED_IRONY);
};
FUNC VOID DIA_Pablo_WANTED_NOTHING()
{
	AI_Output (other, self, "DIA_Pablo_WANTED_NOTHING_15_00"); //Mylisz siê. Jak widzisz, wszystko ze mn¹ w porz¹dku...
	AI_Output (self, other, "DIA_Pablo_WANTED_NOTHING_12_01"); //Jak uwa¿asz, nieznajomy...
	//AI_Output (self, other, "DIA_Pablo_WANTED_NOTHING_12_02"); //Aber wenn du Probleme hast - dann lass sie außerhalb der Stadt. Wir haben hier schon genug Schwierigkeiten.
	AI_Output (self ,other,"DIA_Pablo_Add_12_00"); //Jeœli jednak portret przedstawia TWOJ¥ gêbê, a ty wmiesza³eœ siê w jakieœ k³opoty, to trzymaj siê z dala od miasta. Nie potrzeba nam wiêcej problemów.
	AI_Output (self, other, "DIA_Pablo_WANTED_NOTHING_12_03"); //Nie potrzebujemy tu ¿adnych zabijaków - mam nadziejê, ¿e wyra¿am siê jasno.
	Pablo_belogen = TRUE;
	
	AI_StopProcessInfos (self);
};
FUNC VOID DIA_Pablo_WANTED_IRONY()
{
	AI_Output (other, self, "DIA_Pablo_WANTED_IRONY_15_00"); //No, no. Sam bym na to nie wpad³.
	AI_Output (self, other, "DIA_Pablo_WANTED_IRONY_12_01"); //Bardzo œmieszne... gadaj lepiej, czego chcieli od ciebie ci ludzie?
	//AI_Output (other, self, "DIA_Pablo_WANTED_IRONY_15_02"); //Ich werde sie fragen, wenn ich sie sehe. Ihr habt doch die Kerle eingelocht, die den Wisch dabei hatten, oder?
	AI_Output (other, self,"DIA_Pablo_Add_15_01"); //Zapytaj ich o to sam. Chyba ich zamkn¹³eœ, prawda?
	AI_Output (self, other, "DIA_Pablo_WANTED_IRONY_12_03"); //Nie - nie ¿yj¹.
	AI_Output (other, self, "DIA_Pablo_WANTED_IRONY_15_04"); //W takim razie nigdy siê nie dowiemy.
	//AI_Output (self, other, "DIA_Pablo_WANTED_IRONY_12_05"); //Nun, wenn du in Schwierigkeiten steckst, dann sprich mal mit Lord Andre. Den Wisch kannst du behalten. Schönen Tag noch.
	AI_Output (self ,other,"DIA_Pablo_Add_12_02"); //Jeœli masz jakieœ k³opoty, porozmawiaj z Lordem Andre. Mo¿e on bêdzie w stanie ci pomóc. Znajdziesz go w koszarach.
	
	AI_StopProcessInfos (self);
};

// *************************************************************
// 							Banditen
// *************************************************************
INSTANCE DIA_Pablo_Banditen   (C_INFO)
{
	npc         = Mil_319_Pablo;
	nr          = 3;
	condition   = DIA_Pablo_Banditen_Condition;
	information = DIA_Pablo_Banditen_Info;
	permanent   = FALSE;
	description = "Co wiesz na temat bandytów?";
};
FUNC INT DIA_Pablo_Banditen_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Pablo_Banditen_Info()
{
	AI_Output (other, self,"DIA_Pablo_Add_15_03"); //Co wiesz o bandytach?
	//AI_Output (other, self, "DIA_Pablo_Banditen_15_00"); //Was weißt du über die Banditen, die vor der Stadt ihr Unwesen treiben?
	AI_Output (self ,other,"DIA_Pablo_Add_12_04"); //Przybyli z tej zakichanej kolonii górniczej. Jest jednak kilka oddzielnych grup.
	AI_Output (self ,other,"DIA_Pablo_Add_12_05"); //Niektórzy ukryli siê w górach, inni do³¹czyli do Onara, w³aœciciela ziemskiego.
	AI_Output (self ,other,"DIA_Pablo_Add_12_06"); //Jednak to bandyci na obrze¿ach miasta powoduj¹ najwiêcej problemów.
	AI_Output (self ,other,"DIA_Pablo_Add_12_07"); //To przez nich kupcy nie wyœciubiaj¹ nosów poza granice miasta.
};

// *************************************************************
// 							HakonBandits
// *************************************************************
INSTANCE DIA_Pablo_HakonBandits   (C_INFO)
{
	npc         = Mil_319_Pablo;
	nr          = 3;
	condition   = DIA_Pablo_HakonBandits_Condition;
	information = DIA_Pablo_HakonBandits_Info;
	permanent   = FALSE;
	description = "Co wiesz o bandytach, którzy obrabowali kupca Hakona?";
};
FUNC INT DIA_Pablo_HakonBandits_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Hakon_Miliz))
	&& (Npc_KnowsInfo (other, DIA_Pablo_Banditen))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Pablo_HakonBandits_Info()
{
	AI_Output (other, self,"DIA_Pablo_Add_15_20"); //Co wiesz o bandytach, którzy obrabowali kupca Hakona?
	AI_Output (self ,other,"DIA_Pablo_Add_12_21"); //Och, o tej sprawie mówisz. Nawet mi jej nie przypominaj...
	AI_Output (self ,other,"DIA_Pablo_Add_12_22"); //Podobno ta grupa jest odpowiedzialna za wiele ataków na kupców.
	
	AI_Output (self, other, "DIA_Pablo_Banditen_12_01"); //Ostatnio te szczury powpe³za³y do swoich nor i boj¹ siê wyœciubiæ nosa.
	AI_Output (self, other, "DIA_Pablo_Banditen_12_02"); //Kiedyœ wytropiliœmy ich, ale œlad urwa³ siê nagle w lasach za miastem.
	AI_Output (self, other, "DIA_Pablo_Banditen_12_03"); //W tamtych okolicach grasuje wiele potworów, to zbyt niebezpieczne miejsce.
	
	B_LogEntry(TOPIC_HakonBanditen,"Bandyci, którzy obrabowali Hakona, ukrywaj¹ siê w lasach w pobli¿u miasta." );
	
	if (Pablo_AndreMelden == FALSE)
	{
		AI_Output (self ,other,"DIA_Pablo_Add_12_23"); //Jest jeszcze coœ...
		AI_Output (self, other, "DIA_Pablo_Banditen_12_04"); //Niektóre ze skradzionych towarów pojawi³y siê w Khorinis.
		AI_Output (other, self, "DIA_Pablo_Banditen_15_05"); //Oznacza³oby to, ¿e bandyci przemycaj¹ towary do miasta, i tam je sprzedaj¹.
		AI_Output (self, other, "DIA_Pablo_Banditen_12_06"); //No có¿, podejrzewamy, ¿e maj¹ swojego cz³owieka wœród stra¿ników. Jak dot¹d nie uda³o siê go jednak z³apaæ.
		AI_Output (self, other, "DIA_Pablo_Banditen_12_07"); //Jeœli dowiesz siê czegoœ na ten temat, pamiêtaj - Lord Andre wyznaczy³ nagrodê za odnalezienie tego zdrajcy.
	
		B_LogEntry(TOPIC_HakonBanditen,"Bandyci s¹ prawdopodobnie w zmowie z jakimœ dealerem w mieœcie. Za jego schwytanie Lord Andre wyznaczy³ nagrodê." );
	};
}; 

// *************************************************************
// 							MyBandits
// *************************************************************
INSTANCE DIA_Pablo_MyBandits   (C_INFO)
{
	npc         = Mil_319_Pablo;
	nr          = 4;
	condition   = DIA_Pablo_MyBandits_Condition;
	information = DIA_Pablo_MyBandits_Info;
	permanent   = FALSE;
	description = "Sk¹d przybyli bandyci, którzy mieli list goñczy z moj¹ podobizn¹?";
};
FUNC INT DIA_Pablo_MyBandits_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Pablo_Banditen))
	&& (Npc_KnowsInfo (other, DIA_Pablo_Wanted))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Pablo_MyBandits_Info()
{
	AI_Output (other, self,"DIA_Pablo_Add_15_08"); //Sk¹d przybyli bandyci, którzy mieli list goñczy z moj¹ podobizn¹?
	if (Pablo_belogen == TRUE)
	{
		AI_Output (self ,other,"DIA_Pablo_Add_12_09"); //Aha! Wiêc to jednak TWOJA gêba znajduje siê na tym papierze. Dlaczego siê od razu nie przyzna³eœ, co?
		AI_Output (self ,other,"DIA_Pablo_Add_12_10"); //Za co jesteœ poszukiwany?
		AI_Output (other, self,"DIA_Pablo_Add_15_11"); //Nie wiem - szczerze!
		AI_Output (self ,other,"DIA_Pablo_Add_12_12"); //Tak, tak. Wiem. Pozwól, ¿e coœ ci powiem - gdybym wiedzia³, ¿e trzymasz sztamê z tymi bandytami, dawno siedzia³byœ w pierdlu, rozumiesz?
		AI_Output (self ,other,"DIA_Pablo_Add_12_13"); //Mimo to muszê zg³osiæ ten przypadek Lordowi Andre...
		Pablo_AndreMelden = TRUE;
		AI_Output (self ,other,"DIA_Pablo_Add_12_14"); //Wracaj¹c jednak do twojego pytania...
	};

	AI_Output (self ,other,"DIA_Pablo_Add_12_15"); //Natknêliœmy siê na nich niedaleko domu w³aœciciela ziemskiego.
	AI_Output (self ,other,"DIA_Pablo_Add_12_16"); //Nie wygl¹dali jednak jak banda Onara.
	AI_Output (self ,other,"DIA_Pablo_Add_12_17"); //Wydaje mi siê, ¿e to czêœæ mniejszej grupy, która osiedli³a siê w górach, niedaleko posiad³oœci Onara.
	AI_Output (self ,other,"DIA_Pablo_Add_12_18"); //Jeœli siê tam wybierasz, przyjmij ostrze¿enie. Ci szubrawcy krótko siê z tob¹ rozprawi¹!
	AI_Output (other, self,"DIA_Pablo_Add_15_19"); //Zapamiêtam to.
};

///////////////////////////////////////////////////////////////////////
//	Info Perm
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Pablo_Perm   (C_INFO)
{
	npc         = Mil_319_Pablo;
	nr          = 1;
	condition   = DIA_Pablo_Perm_Condition;
	information = DIA_Pablo_Perm_Info;
	permanent   = TRUE;
	description = "Jak wygl¹da sytuacja?";
};
FUNC INT DIA_Pablo_Perm_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Pablo_Perm_Info()
{
	AI_Output (other, self, "DIA_Pablo_Perm_15_00"); //Jak wygl¹da sytuacja?
	
	if (Kapitel == 3)
	{
		if (MIS_RescueBennet != LOG_SUCCESS)
		{
			if (hero.guild == GIL_MIL)
			|| (hero.guild == GIL_PAL)
			{
				AI_Output (self, other, "DIA_Pablo_Perm_12_01"); //Zawsze powtarza³em, ¿e najemnikom nie wolno ufaæ.
				AI_Output (self, other, "DIA_Pablo_Perm_12_02"); //Najwy¿szy czas daæ tym szumowinom nauczkê. Bennet przecie¿ sam nie wymyœli³ tego wszystkiego.
			}
			else if (hero.guild == GIL_KDF)
			{
				AI_Output (self, other, "DIA_Pablo_Perm_12_03"); //Œmieræ paladyna Lothara wstrz¹snê³a mn¹ do g³êbi.
				AI_Output (self, other, "DIA_Pablo_Perm_12_04"); //Wiem jednak, ¿e s³udzy œwi¹tyni odnajd¹ winnego i surowo go ukarz¹.
			}
			else
			{
				AI_Output (self, other, "DIA_Pablo_Perm_12_05"); //Po co w³óczysz siê po okolicy? Jeœli chcesz uwolniæ tego najemnika, swego kole¿kê, to lepiej od razu o tym zapomnij.
			};
		}
		else //Bennet ist unschuldig
		{
			AI_Output (self, other, "DIA_Pablo_Perm_12_06"); //To ¿a³osne, teraz próbuj¹ nas ze sob¹ sk³óciæ.
			AI_Output (self, other, "DIA_Pablo_Perm_12_07"); //Gdyby nie uda³o ci siê odnaleŸæ prawdziwego winowajcy, orkowie mieliby znacznie u³atwion¹ sprawê.
		};
	}
	else if (Kapitel == 5)
	{
		AI_Output (self, other, "DIA_Pablo_Perm_12_08"); //Martwi mnie to, co mo¿e siê staæ, jeœli paladyni opuszcz¹ to miejsce.
	}
	else if (hero.guild == GIL_KDF)
	{
		AI_Output (self, other, "DIA_Pablo_Perm_12_09"); //Mo¿esz na nas liczyæ, u¿yjemy wszystkich dostêpnych œrodków, by to miasto nie zmieni³o siê w siedlisko zbrodni.
	}
	else if (hero.guild == GIL_SLD)
	|| (hero.guild == GIL_DJG)
	{
		AI_Output (self, other, "DIA_Pablo_Perm_12_10"); //Uwa¿aj na to, co robisz. Takich ³otrzyków jak ty mamy tu ca³y czas na oku.
	}
	else
	{
		AI_Output (self, other, "DIA_Pablo_Perm_12_11"); //W tej chwili panuje tu spokój. Jedynie bandyci spoza miasta sprawiaj¹ pewne problemy.
	};	

}; 



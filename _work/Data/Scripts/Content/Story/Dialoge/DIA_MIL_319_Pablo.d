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
	description = "(Kradzież tego klucza będzie dziecinnie łatwa)";
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
	AI_Output (self, other, "DIA_Pablo_WANTED_12_00"); //Hej ty, zaczekaj! Chyba gdzieś cię już widziałem.
	AI_Output (other, self, "DIA_Pablo_WANTED_15_01"); //Czego chcesz?
	AI_Output (self, other, "DIA_Pablo_WANTED_12_02"); //Mówię przecież, że już cię gdzieś widziałem... a, tak!
	B_UseFakeScroll ();
	AI_Output (self, other, "DIA_Pablo_WANTED_12_03"); //Spójrz - znaleźliśmy ten portret przy bandytach, na których natknęliśmy się kilka dni temu - facet wygląda zupełnie jak ty.
	B_GiveInvItems (self, other, ItWr_Poster_MIS,1);
	AI_Output (self, other, "DIA_Pablo_WANTED_12_04"); //Ci kolesie chyba cię szukali.
	
	
	Info_ClearChoices (DIA_Pablo_WANTED);
	
	Info_AddChoice  (DIA_Pablo_WANTED,"Nie, mylisz się.",DIA_Pablo_WANTED_NOTHING);
	Info_AddChoice 	(DIA_Pablo_WANTED,"No, no. Sam bym na to nie wpadł.",DIA_Pablo_WANTED_IRONY);
};
FUNC VOID DIA_Pablo_WANTED_NOTHING()
{
	AI_Output (other, self, "DIA_Pablo_WANTED_NOTHING_15_00"); //Mylisz się. Jak widzisz, wszystko ze mną w porządku...
	AI_Output (self, other, "DIA_Pablo_WANTED_NOTHING_12_01"); //Jak uważasz, nieznajomy...
	//AI_Output (self, other, "DIA_Pablo_WANTED_NOTHING_12_02"); //Aber wenn du Probleme hast - dann lass sie außerhalb der Stadt. Wir haben hier schon genug Schwierigkeiten.
	AI_Output (self ,other,"DIA_Pablo_Add_12_00"); //Jeśli jednak portret przedstawia TWOJĄ gębę, a ty wmieszałeś się w jakieś kłopoty, to trzymaj się z dala od miasta. Nie potrzeba nam więcej problemów.
	AI_Output (self, other, "DIA_Pablo_WANTED_NOTHING_12_03"); //Nie potrzebujemy tu żadnych zabijaków - mam nadzieję, że wyrażam się jasno.
	Pablo_belogen = TRUE;
	
	AI_StopProcessInfos (self);
};
FUNC VOID DIA_Pablo_WANTED_IRONY()
{
	AI_Output (other, self, "DIA_Pablo_WANTED_IRONY_15_00"); //No, no. Sam bym na to nie wpadł.
	AI_Output (self, other, "DIA_Pablo_WANTED_IRONY_12_01"); //Bardzo śmieszne... gadaj lepiej, czego chcieli od ciebie ci ludzie?
	//AI_Output (other, self, "DIA_Pablo_WANTED_IRONY_15_02"); //Ich werde sie fragen, wenn ich sie sehe. Ihr habt doch die Kerle eingelocht, die den Wisch dabei hatten, oder?
	AI_Output (other, self,"DIA_Pablo_Add_15_01"); //Zapytaj ich o to sam. Chyba ich zamknąłeś, prawda?
	AI_Output (self, other, "DIA_Pablo_WANTED_IRONY_12_03"); //Nie - nie żyją.
	AI_Output (other, self, "DIA_Pablo_WANTED_IRONY_15_04"); //W takim razie nigdy się nie dowiemy.
	//AI_Output (self, other, "DIA_Pablo_WANTED_IRONY_12_05"); //Nun, wenn du in Schwierigkeiten steckst, dann sprich mal mit Lord Andre. Den Wisch kannst du behalten. Schönen Tag noch.
	AI_Output (self ,other,"DIA_Pablo_Add_12_02"); //Jeśli masz jakieś kłopoty, porozmawiaj z Lordem Andre. Może on będzie w stanie ci pomóc. Znajdziesz go w koszarach.
	
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
	AI_Output (self ,other,"DIA_Pablo_Add_12_05"); //Niektórzy ukryli się w górach, inni dołączyli do Onara, właściciela ziemskiego.
	AI_Output (self ,other,"DIA_Pablo_Add_12_06"); //Jednak to bandyci na obrzeżach miasta powodują najwięcej problemów.
	AI_Output (self ,other,"DIA_Pablo_Add_12_07"); //To przez nich kupcy nie wyściubiają nosów poza granice miasta.
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
	
	AI_Output (self, other, "DIA_Pablo_Banditen_12_01"); //Ostatnio te szczury powpełzały do swoich nor i boją się wyściubić nosa.
	AI_Output (self, other, "DIA_Pablo_Banditen_12_02"); //Kiedyś wytropiliśmy ich, ale ślad urwał się nagle w lasach za miastem.
	AI_Output (self, other, "DIA_Pablo_Banditen_12_03"); //W tamtych okolicach grasuje wiele potworów, to zbyt niebezpieczne miejsce.
	
	B_LogEntry(TOPIC_HakonBanditen,"Bandyci, którzy obrabowali Hakona, ukrywają się w lasach w pobliżu miasta." );
	
	if (Pablo_AndreMelden == FALSE)
	{
		AI_Output (self ,other,"DIA_Pablo_Add_12_23"); //Jest jeszcze coś...
		AI_Output (self, other, "DIA_Pablo_Banditen_12_04"); //Niektóre ze skradzionych towarów pojawiły się w Khorinis.
		AI_Output (other, self, "DIA_Pablo_Banditen_15_05"); //Oznaczałoby to, że bandyci przemycają towary do miasta, i tam je sprzedają.
		AI_Output (self, other, "DIA_Pablo_Banditen_12_06"); //No cóż, podejrzewamy, że mają swojego człowieka wśród strażników. Jak dotąd nie udało się go jednak złapać.
		AI_Output (self, other, "DIA_Pablo_Banditen_12_07"); //Jeśli dowiesz się czegoś na ten temat, pamiętaj - Lord Andre wyznaczył nagrodę za odnalezienie tego zdrajcy.
	
		B_LogEntry(TOPIC_HakonBanditen,"Bandyci są prawdopodobnie w zmowie z jakimś dealerem w mieście. Za jego schwytanie Lord Andre wyznaczył nagrodę." );
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
	description = "Skąd przybyli bandyci, którzy mieli list gończy z moją podobizną?";
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
	AI_Output (other, self,"DIA_Pablo_Add_15_08"); //Skąd przybyli bandyci, którzy mieli list gończy z moją podobizną?
	if (Pablo_belogen == TRUE)
	{
		AI_Output (self ,other,"DIA_Pablo_Add_12_09"); //Aha! Więc to jednak TWOJA gęba znajduje się na tym papierze. Dlaczego się od razu nie przyznałeś, co?
		AI_Output (self ,other,"DIA_Pablo_Add_12_10"); //Za co jesteś poszukiwany?
		AI_Output (other, self,"DIA_Pablo_Add_15_11"); //Nie wiem - szczerze!
		AI_Output (self ,other,"DIA_Pablo_Add_12_12"); //Tak, tak. Wiem. Pozwól, że coś ci powiem - gdybym wiedział, że trzymasz sztamę z tymi bandytami, dawno siedziałbyś w pierdlu, rozumiesz?
		AI_Output (self ,other,"DIA_Pablo_Add_12_13"); //Mimo to muszę zgłosić ten przypadek Lordowi Andre...
		Pablo_AndreMelden = TRUE;
		AI_Output (self ,other,"DIA_Pablo_Add_12_14"); //Wracając jednak do twojego pytania...
	};

	AI_Output (self ,other,"DIA_Pablo_Add_12_15"); //Natknęliśmy się na nich niedaleko domu właściciela ziemskiego.
	AI_Output (self ,other,"DIA_Pablo_Add_12_16"); //Nie wyglądali jednak jak banda Onara.
	AI_Output (self ,other,"DIA_Pablo_Add_12_17"); //Wydaje mi się, że to część mniejszej grupy, która osiedliła się w górach, niedaleko posiadłości Onara.
	AI_Output (self ,other,"DIA_Pablo_Add_12_18"); //Jeśli się tam wybierasz, przyjmij ostrzeżenie. Ci szubrawcy krótko się z tobą rozprawią!
	AI_Output (other, self,"DIA_Pablo_Add_15_19"); //Zapamiętam to.
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
	description = "Jak wygląda sytuacja?";
};
FUNC INT DIA_Pablo_Perm_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Pablo_Perm_Info()
{
	AI_Output (other, self, "DIA_Pablo_Perm_15_00"); //Jak wygląda sytuacja?
	
	if (Kapitel == 3)
	{
		if (MIS_RescueBennet != LOG_SUCCESS)
		{
			if (hero.guild == GIL_MIL)
			|| (hero.guild == GIL_PAL)
			{
				AI_Output (self, other, "DIA_Pablo_Perm_12_01"); //Zawsze powtarzałem, że najemnikom nie wolno ufać.
				AI_Output (self, other, "DIA_Pablo_Perm_12_02"); //Najwyższy czas dać tym szumowinom nauczkę. Bennet przecież sam nie wymyślił tego wszystkiego.
			}
			else if (hero.guild == GIL_KDF)
			{
				AI_Output (self, other, "DIA_Pablo_Perm_12_03"); //Śmierć paladyna Lothara wstrząsnęła mną do głębi.
				AI_Output (self, other, "DIA_Pablo_Perm_12_04"); //Wiem jednak, że słudzy świątyni odnajdą winnego i surowo go ukarzą.
			}
			else
			{
				AI_Output (self, other, "DIA_Pablo_Perm_12_05"); //Po co włóczysz się po okolicy? Jeśli chcesz uwolnić tego najemnika, swego koleżkę, to lepiej od razu o tym zapomnij.
			};
		}
		else //Bennet ist unschuldig
		{
			AI_Output (self, other, "DIA_Pablo_Perm_12_06"); //To żałosne, teraz próbują nas ze sobą skłócić.
			AI_Output (self, other, "DIA_Pablo_Perm_12_07"); //Gdyby nie udało ci się odnaleźć prawdziwego winowajcy, orkowie mieliby znacznie ułatwioną sprawę.
		};
	}
	else if (Kapitel == 5)
	{
		AI_Output (self, other, "DIA_Pablo_Perm_12_08"); //Martwi mnie to, co może się stać, jeśli paladyni opuszczą to miejsce.
	}
	else if (hero.guild == GIL_KDF)
	{
		AI_Output (self, other, "DIA_Pablo_Perm_12_09"); //Możesz na nas liczyć, użyjemy wszystkich dostępnych środków, by to miasto nie zmieniło się w siedlisko zbrodni.
	}
	else if (hero.guild == GIL_SLD)
	|| (hero.guild == GIL_DJG)
	{
		AI_Output (self, other, "DIA_Pablo_Perm_12_10"); //Uważaj na to, co robisz. Takich łotrzyków jak ty mamy tu cały czas na oku.
	}
	else
	{
		AI_Output (self, other, "DIA_Pablo_Perm_12_11"); //W tej chwili panuje tu spokój. Jedynie bandyci spoza miasta sprawiają pewne problemy.
	};	

}; 



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
	description = "(Kradzie� tego klucza b�dzie dziecinnie �atwa)";
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
	AI_Output (self, other, "DIA_Pablo_WANTED_12_00"); //Hej ty, zaczekaj! Chyba gdzie� ci� ju� widzia�em.
	AI_Output (other, self, "DIA_Pablo_WANTED_15_01"); //Czego chcesz?
	AI_Output (self, other, "DIA_Pablo_WANTED_12_02"); //M�wi� przecie�, �e ju� ci� gdzie� widzia�em... a, tak!
	B_UseFakeScroll ();
	AI_Output (self, other, "DIA_Pablo_WANTED_12_03"); //Sp�jrz - znale�li�my ten portret przy bandytach, na kt�rych natkn�li�my si� kilka dni temu - facet wygl�da zupe�nie jak ty.
	B_GiveInvItems (self, other, ItWr_Poster_MIS,1);
	AI_Output (self, other, "DIA_Pablo_WANTED_12_04"); //Ci kolesie chyba ci� szukali.
	
	
	Info_ClearChoices (DIA_Pablo_WANTED);
	
	Info_AddChoice  (DIA_Pablo_WANTED,"Nie, mylisz si�.",DIA_Pablo_WANTED_NOTHING);
	Info_AddChoice 	(DIA_Pablo_WANTED,"No, no. Sam bym na to nie wpad�.",DIA_Pablo_WANTED_IRONY);
};
FUNC VOID DIA_Pablo_WANTED_NOTHING()
{
	AI_Output (other, self, "DIA_Pablo_WANTED_NOTHING_15_00"); //Mylisz si�. Jak widzisz, wszystko ze mn� w porz�dku...
	AI_Output (self, other, "DIA_Pablo_WANTED_NOTHING_12_01"); //Jak uwa�asz, nieznajomy...
	//AI_Output (self, other, "DIA_Pablo_WANTED_NOTHING_12_02"); //Aber wenn du Probleme hast - dann lass sie au�erhalb der Stadt. Wir haben hier schon genug Schwierigkeiten.
	AI_Output (self ,other,"DIA_Pablo_Add_12_00"); //Je�li jednak portret przedstawia TWOJ� g�b�, a ty wmiesza�e� si� w jakie� k�opoty, to trzymaj si� z dala od miasta. Nie potrzeba nam wi�cej problem�w.
	AI_Output (self, other, "DIA_Pablo_WANTED_NOTHING_12_03"); //Nie potrzebujemy tu �adnych zabijak�w - mam nadziej�, �e wyra�am si� jasno.
	Pablo_belogen = TRUE;
	
	AI_StopProcessInfos (self);
};
FUNC VOID DIA_Pablo_WANTED_IRONY()
{
	AI_Output (other, self, "DIA_Pablo_WANTED_IRONY_15_00"); //No, no. Sam bym na to nie wpad�.
	AI_Output (self, other, "DIA_Pablo_WANTED_IRONY_12_01"); //Bardzo �mieszne... gadaj lepiej, czego chcieli od ciebie ci ludzie?
	//AI_Output (other, self, "DIA_Pablo_WANTED_IRONY_15_02"); //Ich werde sie fragen, wenn ich sie sehe. Ihr habt doch die Kerle eingelocht, die den Wisch dabei hatten, oder?
	AI_Output (other, self,"DIA_Pablo_Add_15_01"); //Zapytaj ich o to sam. Chyba ich zamkn��e�, prawda?
	AI_Output (self, other, "DIA_Pablo_WANTED_IRONY_12_03"); //Nie - nie �yj�.
	AI_Output (other, self, "DIA_Pablo_WANTED_IRONY_15_04"); //W takim razie nigdy si� nie dowiemy.
	//AI_Output (self, other, "DIA_Pablo_WANTED_IRONY_12_05"); //Nun, wenn du in Schwierigkeiten steckst, dann sprich mal mit Lord Andre. Den Wisch kannst du behalten. Sch�nen Tag noch.
	AI_Output (self ,other,"DIA_Pablo_Add_12_02"); //Je�li masz jakie� k�opoty, porozmawiaj z Lordem Andre. Mo�e on b�dzie w stanie ci pom�c. Znajdziesz go w koszarach.
	
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
	description = "Co wiesz na temat bandyt�w?";
};
FUNC INT DIA_Pablo_Banditen_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Pablo_Banditen_Info()
{
	AI_Output (other, self,"DIA_Pablo_Add_15_03"); //Co wiesz o bandytach?
	//AI_Output (other, self, "DIA_Pablo_Banditen_15_00"); //Was wei�t du �ber die Banditen, die vor der Stadt ihr Unwesen treiben?
	AI_Output (self ,other,"DIA_Pablo_Add_12_04"); //Przybyli z tej zakichanej kolonii g�rniczej. Jest jednak kilka oddzielnych grup.
	AI_Output (self ,other,"DIA_Pablo_Add_12_05"); //Niekt�rzy ukryli si� w g�rach, inni do��czyli do Onara, w�a�ciciela ziemskiego.
	AI_Output (self ,other,"DIA_Pablo_Add_12_06"); //Jednak to bandyci na obrze�ach miasta powoduj� najwi�cej problem�w.
	AI_Output (self ,other,"DIA_Pablo_Add_12_07"); //To przez nich kupcy nie wy�ciubiaj� nos�w poza granice miasta.
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
	description = "Co wiesz o bandytach, kt�rzy obrabowali kupca Hakona?";
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
	AI_Output (other, self,"DIA_Pablo_Add_15_20"); //Co wiesz o bandytach, kt�rzy obrabowali kupca Hakona?
	AI_Output (self ,other,"DIA_Pablo_Add_12_21"); //Och, o tej sprawie m�wisz. Nawet mi jej nie przypominaj...
	AI_Output (self ,other,"DIA_Pablo_Add_12_22"); //Podobno ta grupa jest odpowiedzialna za wiele atak�w na kupc�w.
	
	AI_Output (self, other, "DIA_Pablo_Banditen_12_01"); //Ostatnio te szczury powpe�za�y do swoich nor i boj� si� wy�ciubi� nosa.
	AI_Output (self, other, "DIA_Pablo_Banditen_12_02"); //Kiedy� wytropili�my ich, ale �lad urwa� si� nagle w lasach za miastem.
	AI_Output (self, other, "DIA_Pablo_Banditen_12_03"); //W tamtych okolicach grasuje wiele potwor�w, to zbyt niebezpieczne miejsce.
	
	B_LogEntry(TOPIC_HakonBanditen,"Bandyci, kt�rzy obrabowali Hakona, ukrywaj� si� w lasach w pobli�u miasta." );
	
	if (Pablo_AndreMelden == FALSE)
	{
		AI_Output (self ,other,"DIA_Pablo_Add_12_23"); //Jest jeszcze co�...
		AI_Output (self, other, "DIA_Pablo_Banditen_12_04"); //Niekt�re ze skradzionych towar�w pojawi�y si� w Khorinis.
		AI_Output (other, self, "DIA_Pablo_Banditen_15_05"); //Oznacza�oby to, �e bandyci przemycaj� towary do miasta, i tam je sprzedaj�.
		AI_Output (self, other, "DIA_Pablo_Banditen_12_06"); //No c�, podejrzewamy, �e maj� swojego cz�owieka w�r�d stra�nik�w. Jak dot�d nie uda�o si� go jednak z�apa�.
		AI_Output (self, other, "DIA_Pablo_Banditen_12_07"); //Je�li dowiesz si� czego� na ten temat, pami�taj - Lord Andre wyznaczy� nagrod� za odnalezienie tego zdrajcy.
	
		B_LogEntry(TOPIC_HakonBanditen,"Bandyci s� prawdopodobnie w zmowie z jakim� dealerem w mie�cie. Za jego schwytanie Lord Andre wyznaczy� nagrod�." );
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
	description = "Sk�d przybyli bandyci, kt�rzy mieli list go�czy z moj� podobizn�?";
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
	AI_Output (other, self,"DIA_Pablo_Add_15_08"); //Sk�d przybyli bandyci, kt�rzy mieli list go�czy z moj� podobizn�?
	if (Pablo_belogen == TRUE)
	{
		AI_Output (self ,other,"DIA_Pablo_Add_12_09"); //Aha! Wi�c to jednak TWOJA g�ba znajduje si� na tym papierze. Dlaczego si� od razu nie przyzna�e�, co?
		AI_Output (self ,other,"DIA_Pablo_Add_12_10"); //Za co jeste� poszukiwany?
		AI_Output (other, self,"DIA_Pablo_Add_15_11"); //Nie wiem - szczerze!
		AI_Output (self ,other,"DIA_Pablo_Add_12_12"); //Tak, tak. Wiem. Pozw�l, �e co� ci powiem - gdybym wiedzia�, �e trzymasz sztam� z tymi bandytami, dawno siedzia�by� w pierdlu, rozumiesz?
		AI_Output (self ,other,"DIA_Pablo_Add_12_13"); //Mimo to musz� zg�osi� ten przypadek Lordowi Andre...
		Pablo_AndreMelden = TRUE;
		AI_Output (self ,other,"DIA_Pablo_Add_12_14"); //Wracaj�c jednak do twojego pytania...
	};

	AI_Output (self ,other,"DIA_Pablo_Add_12_15"); //Natkn�li�my si� na nich niedaleko domu w�a�ciciela ziemskiego.
	AI_Output (self ,other,"DIA_Pablo_Add_12_16"); //Nie wygl�dali jednak jak banda Onara.
	AI_Output (self ,other,"DIA_Pablo_Add_12_17"); //Wydaje mi si�, �e to cz�� mniejszej grupy, kt�ra osiedli�a si� w g�rach, niedaleko posiad�o�ci Onara.
	AI_Output (self ,other,"DIA_Pablo_Add_12_18"); //Je�li si� tam wybierasz, przyjmij ostrze�enie. Ci szubrawcy kr�tko si� z tob� rozprawi�!
	AI_Output (other, self,"DIA_Pablo_Add_15_19"); //Zapami�tam to.
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
	description = "Jak wygl�da sytuacja?";
};
FUNC INT DIA_Pablo_Perm_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Pablo_Perm_Info()
{
	AI_Output (other, self, "DIA_Pablo_Perm_15_00"); //Jak wygl�da sytuacja?
	
	if (Kapitel == 3)
	{
		if (MIS_RescueBennet != LOG_SUCCESS)
		{
			if (hero.guild == GIL_MIL)
			|| (hero.guild == GIL_PAL)
			{
				AI_Output (self, other, "DIA_Pablo_Perm_12_01"); //Zawsze powtarza�em, �e najemnikom nie wolno ufa�.
				AI_Output (self, other, "DIA_Pablo_Perm_12_02"); //Najwy�szy czas da� tym szumowinom nauczk�. Bennet przecie� sam nie wymy�li� tego wszystkiego.
			}
			else if (hero.guild == GIL_KDF)
			{
				AI_Output (self, other, "DIA_Pablo_Perm_12_03"); //�mier� paladyna Lothara wstrz�sn�a mn� do g��bi.
				AI_Output (self, other, "DIA_Pablo_Perm_12_04"); //Wiem jednak, �e s�udzy �wi�tyni odnajd� winnego i surowo go ukarz�.
			}
			else
			{
				AI_Output (self, other, "DIA_Pablo_Perm_12_05"); //Po co w��czysz si� po okolicy? Je�li chcesz uwolni� tego najemnika, swego kole�k�, to lepiej od razu o tym zapomnij.
			};
		}
		else //Bennet ist unschuldig
		{
			AI_Output (self, other, "DIA_Pablo_Perm_12_06"); //To �a�osne, teraz pr�buj� nas ze sob� sk��ci�.
			AI_Output (self, other, "DIA_Pablo_Perm_12_07"); //Gdyby nie uda�o ci si� odnale�� prawdziwego winowajcy, orkowie mieliby znacznie u�atwion� spraw�.
		};
	}
	else if (Kapitel == 5)
	{
		AI_Output (self, other, "DIA_Pablo_Perm_12_08"); //Martwi mnie to, co mo�e si� sta�, je�li paladyni opuszcz� to miejsce.
	}
	else if (hero.guild == GIL_KDF)
	{
		AI_Output (self, other, "DIA_Pablo_Perm_12_09"); //Mo�esz na nas liczy�, u�yjemy wszystkich dost�pnych �rodk�w, by to miasto nie zmieni�o si� w siedlisko zbrodni.
	}
	else if (hero.guild == GIL_SLD)
	|| (hero.guild == GIL_DJG)
	{
		AI_Output (self, other, "DIA_Pablo_Perm_12_10"); //Uwa�aj na to, co robisz. Takich �otrzyk�w jak ty mamy tu ca�y czas na oku.
	}
	else
	{
		AI_Output (self, other, "DIA_Pablo_Perm_12_11"); //W tej chwili panuje tu spok�j. Jedynie bandyci spoza miasta sprawiaj� pewne problemy.
	};	

}; 



// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Addon_Francis_EXIT(C_INFO)
{
	npc			= PIR_1350_Addon_Francis;
	nr			= 999;
	condition	= DIA_Addon_Francis_EXIT_Condition;
	information	= DIA_Addon_Francis_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Addon_Francis_EXIT_Condition()
{
	if (GregIsBack == FALSE)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Addon_Francis_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 			  			In Gregs Hütte rein 
// ************************************************************
// ------------------------------------------------------------
// 			  		Spieler kennt Hütte nicht
// ------------------------------------------------------------
INSTANCE DIA_Addon_Francis_First (C_INFO)
{
	npc			= PIR_1350_Addon_Francis;
	nr			= 1;
	condition	= DIA_Addon_Francis_First_Condition;
	information	= DIA_Addon_Francis_First_Info;
	permanent	= FALSE;
	description = "To twoja chata?";
};                       
FUNC INT DIA_Addon_Francis_First_Condition()
{
	if (Knows_GregsHut == FALSE)
	&& (Francis_ausgeschissen == FALSE)
	&& (Npc_HasItems (self, ITKE_Greg_ADDON_MIS))
	{
		return TRUE;
	};
};
func VOID DIA_Addon_Francis_First_Info()
{	
	AI_Output (other,self,"DIA_Addon_Francis_GregsHut_15_00"); //To twoja chata?
	AI_Output (self,other,"DIA_Addon_Francis_GregsHut_13_01"); //Nie, należy do Grega.
	Knows_GregsHut = TRUE;
};
// ------------------------------------------------------------
// 			  			Ich muß da rein!
// ------------------------------------------------------------
INSTANCE DIA_Addon_Francis_LetMeIn (C_INFO)
{
	npc			= PIR_1350_Addon_Francis;
	nr			= 2;
	condition	= DIA_Addon_Francis_LetMeIn_Condition;
	information	= DIA_Addon_Francis_LetMeIn_Info;
	permanent	= FALSE;
	description = "Muszę się dostać do chaty Grega.";
};                       
FUNC INT DIA_Addon_Francis_LetMeIn_Condition()
{
	if ( (Npc_KnowsInfo (other, DIA_Addon_Francis_First)) || (Knows_GregsHut == TRUE) )
	&& (Francis_ausgeschissen == FALSE)
	&& (Npc_HasItems (self, ITKE_Greg_ADDON_MIS))
	{
		return TRUE;
	};
};
func VOID DIA_Addon_Francis_LetMeIn_Info()
{	
	AI_Output (other, self ,"DIA_Addon_Francis_LetMeIn_15_00"); //Muszę się dostać do chaty Grega.
	AI_Output (self ,other ,"DIA_Addon_Francis_LetMeIn_13_01"); //Nie ma mowy!
	AI_Output (self ,other ,"DIA_Addon_Francis_LetMeIn_13_02"); //Grega nie ma, a ja zamknąłem drzwi, żeby nikt nie wpadł na pomysł zabrania sobie czegoś. 
	AI_Output (self ,other ,"DIA_Addon_Francis_LetMeIn_13_03"); //Więc lepiej spływaj, albo porachuję ci kości.
};
// ------------------------------------------------------------
// 			  			Hab Greg getroffen!
// ------------------------------------------------------------
INSTANCE DIA_Addon_Francis_AboutGreg (C_INFO)
{
	npc			= PIR_1350_Addon_Francis;
	nr			= 3;
	condition	= DIA_Addon_Francis_AboutGreg_Condition;
	information	= DIA_Addon_Francis_AboutGreg_Info;
	permanent	= FALSE;
	description = "Greg jest waszym szefem?";
};                       
FUNC INT DIA_Addon_Francis_AboutGreg_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Francis_LetMeIn))
	&& (Francis_ausgeschissen == FALSE)
	{
		return TRUE;
	};
};
func VOID DIA_Addon_Francis_AboutGreg_Info()
{	
	AI_Output (other, self ,"DIA_Addon_Francis_AboutGreg_15_00"); //Greg jest waszym szefem?
	AI_Output (self ,other ,"DIA_Addon_Francis_AboutGreg_13_01"); //Też mi coś!
	AI_Output (self ,other ,"DIA_Addon_Francis_AboutGreg_13_02"); //Każdy żeglarz i każdy szczur lądowy na tej wyspie słyszał o straszliwym kapitanie Gregu!
	AI_Output (self ,other ,"DIA_Addon_Francis_AboutGreg_13_03"); //I właśnie on powierzył mi komendę nad resztą ludzi!
	AI_Output (self ,other ,"DIA_Addon_Francis_AboutGreg_13_04"); //Mam zadbać, żeby cała ta banda nie rozpuściła się do reszty pod jego nieobecność.
	AI_Output (self ,other ,"DIA_Addon_Francis_AboutGreg_13_05"); //Niektórzy myślą, że mogą robić, co im się żywnie podoba, tylko dlatego że kapitana Grega nie ma w pobliżu.
	AI_Output (self ,other ,"DIA_Addon_Francis_AboutGreg_13_06"); //Ale się zdziwią, kiedy Greg wróci. 
	AI_Output (self ,other ,"DIA_Addon_Francis_AboutGreg_13_07"); //Opowiem mu wszystko, słyszysz?
	AI_Output (self ,other ,"DIA_Addon_Francis_AboutGreg_13_08"); //Także to, że ktoś próbował myszkować w jego chacie!
	AI_Output (self ,other ,"DIA_Addon_Francis_AboutGreg_13_09"); //Odsuń się więc, albo popadniesz w nieliche kłopoty.
};
// ------------------------------------------------------------
// 		  			Gib mir Schlüssel + Bestechung!
// ------------------------------------------------------------
var int Francis_bezahlt;

INSTANCE DIA_Addon_Francis_Key (C_INFO)
{
	npc			= PIR_1350_Addon_Francis;
	nr			= 4;
	condition	= DIA_Addon_Francis_Key_Condition;
	information	= DIA_Addon_Francis_Key_Info;
	permanent	= TRUE;
	description = "Daj mi klucz do chaty Grega!";
};                       
FUNC INT DIA_Addon_Francis_Key_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Francis_LetMeIn))
	&& (Npc_HasItems (self, ITKE_Greg_ADDON_MIS))
	{
		return TRUE;
	};
};
func VOID DIA_Addon_Francis_Key_Info()
{	
	AI_Output (other, self,"DIA_Addon_Francis_Key_15_00"); //Daj mi klucz do chaty Grega!
	AI_Output (self ,other,"DIA_Addon_Francis_Key_13_01"); //Chyba żartujesz!
	
	Info_ClearChoices (DIA_Addon_Francis_Key);
	Info_AddChoice (DIA_Addon_Francis_Key, "Będę musiał o tym pomyśleć...", DIA_Addon_Francis_Key_BACK);
	Info_AddChoice (DIA_Addon_Francis_Key, "Co powiesz na 2000 sztuk złota?", DIA_Addon_Francis_Key_2000Gold);
	Info_AddChoice (DIA_Addon_Francis_Key, "Dam ci za to 1000 sztuk złota!", DIA_Addon_Francis_Key_1000Gold);
};
func void DIA_Addon_Francis_Key_BACK()
{
	Info_ClearChoices (DIA_Addon_Francis_Key);
};
func void DIA_Addon_Francis_Key_1000Gold()
{
	AI_Output (other, self ,"DIA_Addon_Francis_Key_1000Gold_15_00"); //Dam ci za to 1000 sztuk złota!
	AI_Output (self ,other ,"DIA_Addon_Francis_Key_1000Gold_13_01"); //To trochę mało, zważywszy, że nakłaniasz mnie do zdrady mego kapitana!
	AI_Output (self ,other ,"DIA_Addon_Francis_Key_1000Gold_13_02"); //Lepiej uważaj, co mówisz, albo będę musiał przetrzepać ci skórę!
};
func void DIA_Addon_Francis_Key_2000Gold()
{
	AI_Output (other,self ,"DIA_Addon_Francis_Key_2000Gold_15_00"); //Co powiesz na 2000 sztuk złota?
	
	if (Npc_HasItems (other,ItMI_Gold) >= 2000)
	{
		AI_Output (self ,other,"DIA_Addon_Francis_Key_2000Gold_13_01"); //Chłopcze, czyżbyś chciał mnie nakłonić do zdrady?
		AI_Output (self ,other,"DIA_Addon_Francis_Key_2000Gold_13_02"); //Chociaż z drugiej strony...
		AI_Output (self ,other,"DIA_Addon_Francis_Key_2000Gold_13_03"); //Czego się boisz? Przecież nikt się nie dowie.
		AI_Output (self ,other,"DIA_Addon_Francis_Key_2000Gold_13_04"); //Dobra, oto klucz.
		AI_Output (self ,other,"DIA_Addon_Francis_Key_2000Gold_13_05"); //Tylko pospiesz się, bo Greg może przyjść w każdej chwili. I ani słowa innym, jasne?
		B_GiveInvItems (other, self,ItMi_Gold,2000);
		B_GiveInvItems (self ,other,ITKE_Greg_ADDON_MIS,1);
		Francis_bezahlt = TRUE;
	}
	else 
	{
		AI_Output (self ,other,"DIA_Addon_FrancisNotEnoughGold_13_05"); //Nie masz przy sobie takiej sumy!
	};
	Info_ClearChoices (DIA_Addon_Francis_Key);
};
// ------------------------------------------------------------
// 			  				Aufs Maul!
// ------------------------------------------------------------
INSTANCE DIA_Addon_Francis_AufsMaul (C_INFO)
{
	npc			= PIR_1350_Addon_Francis;
	nr			= 5;
	condition	= DIA_Addon_Francis_AufsMaul_Condition;
	information	= DIA_Addon_Francis_AufsMaul_Info;
	permanent	= TRUE;
	description = "No to zobaczymy, co potrafisz. Stawaj!";
};                       
FUNC INT DIA_Addon_Francis_AufsMaul_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Francis_LetMeIn))
	&& (Npc_HasItems (self, ITKE_Greg_ADDON_MIS))
	{
		return TRUE;
	};
};
func VOID DIA_Addon_Francis_AufsMaul_Info()
{	
	AI_Output (other, self, "DIA_Addon_Francis_AufsMaul_15_00"); //No to zobaczymy, co potrafisz. Stawaj!
	AI_Output (self, other, "DIA_Addon_Francis_AufsMaul_13_01"); //Co? Jestem tu kapitanem! 
	AI_Output (self, other, "DIA_Addon_Francis_AufsMaul_13_02"); //Nauczę cię szacunku, ty szczurze lądowy!
	
	AI_StopProcessInfos (self);
	B_Attack(self, other, AR_NONE, 1);
};
// ------------------------------------------------------------
// 			  		Ich habe dein Versteck gefunden...
// ------------------------------------------------------------
INSTANCE DIA_Addon_Francis_Buch (C_INFO)
{
	npc			= PIR_1350_Addon_Francis;
	nr			= 5;
	condition	= DIA_Addon_Francis_Buch_Condition;
	information	= DIA_Addon_Francis_Buch_Info;
	permanent	= TRUE;
	description = "Znalazłem twoją kryjówkę i skarb. To twój dziennik, prawda?";
};                       
FUNC INT DIA_Addon_Francis_Buch_Condition()
{
	if (Npc_HasItems (other, ITWR_Addon_FrancisAbrechnung_Mis))
	{
		return TRUE;
	};
};
func VOID DIA_Addon_Francis_Buch_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Francis_Key_Business_15_03"); //Znalazłem twoją kryjówkę i skarb. To twój dziennik, prawda?
	AI_Output (self, other, "DIA_Addon_Francis_Buch_13_01"); //Eeee... Nigdy wcześniej go nie widziałem...
	AI_Output (self, other, "DIA_Addon_Francis_Buch_13_02"); //Hmm... Jeśli to nawet byłby mój dziennik...
	AI_Output (self, other, "DIA_Addon_Francis_Buch_13_03"); //To chyba nie sądzisz, że moi chłopcy uwierzą ci tylko dlatego, że masz przy sobie jakieś pożółkłe notatki?
	AI_Output (other,self ,"DIA_Addon_Francis_Key_Business_15_01"); //Wykiwałeś ich przy podziale łupu.
	AI_Output (self, other, "DIA_Addon_Francis_Buch_13_04"); //Ej... Poczekaj...
	if (Npc_HasItems (self, ITKE_Greg_ADDON_MIS))
	{
		if (Npc_KnowsInfo (other, DIA_Addon_Francis_LetMeIn))
		{
			AI_Output (self, other, "DIA_Addon_Francis_Buch_13_05"); //Nie chciałeś przypadkiem klucza do chaty Grega?
		};
		AI_Output (self, other, "DIA_Addon_Francis_Buch_13_06"); //Dam ci klucz do chaty kapitana!
		AI_Output (self, other, "DIA_Addon_Francis_Buch_13_07"); //Tam jest naprawdę dużo cennych przedmiotów...
		AI_Output (self, other, "DIA_Addon_Francis_Buch_13_08"); //Ale teraz dawaj notatnik i trzymaj gębę na kłódkę. Umowa stoi?
		B_GiveInvItems (other,self,ITWR_Addon_FrancisAbrechnung_Mis,1);
		B_GiveInvItems (self ,other,ITKE_Greg_ADDON_MIS,1);
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Francis_Buch_13_09"); //Tylko nie zrób czegoś głupiego!
		if (Francis_bezahlt == TRUE)
		&& (Npc_HasItems(self, itmi_gold) >= 2000)
		{
			AI_Output (self, other, "DIA_Addon_Francis_Buch_13_10"); //Oto twoje 2000 sztuk złota!
			AI_Output (self, other, "DIA_Addon_Francis_Buch_13_11"); //I jeszcze 500, żebyś nie mówił, że na skąpca trafiłeś.
			B_GiveInvItems (self, other, itmi_gold, 2500);
		}
		else
		{
			AI_Output (self, other, "DIA_Addon_Francis_Buch_13_12"); //Oto 500 sztuk złota!
			B_GiveInvItems (self, other, itmi_gold, 500);
		};
		AI_Output (self, other, "DIA_Addon_Francis_Buch_13_13"); //A teraz dawaj ten cholerny...
		B_GiveInvItems (other,self,ITWR_Addon_FrancisAbrechnung_Mis,1);
	};
	AI_StopProcessInfos (self);
};

// ------------------------------------------------------------
// 			  				PICK POCKET
// ------------------------------------------------------------
instance DIA_Francis_PICKPOCKET (C_INFO)
{
	npc			= PIR_1350_Addon_Francis;
	nr			= 900;
	condition	= DIA_Francis_PICKPOCKET_Condition;
	information	= DIA_Francis_PICKPOCKET_Info;
	permanent	= TRUE;
	description = "(Łatwo byłoby ukraść ten klucz)";
};                       
func INT DIA_Francis_PICKPOCKET_Condition()
{
	if (Npc_GetTalentSkill (other,NPC_TALENT_PICKPOCKET) == 1) 
	&& (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (Npc_HasItems (self, ITKE_Greg_ADDON_MIS) >= 1)
	&& (other.attribute[ATR_DEXTERITY] >= (40 - Theftdiff))
	{
		return TRUE;
	};
};
func VOID DIA_Francis_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Francis_PICKPOCKET);
	Info_AddChoice		(DIA_Francis_PICKPOCKET, DIALOG_BACK 		,DIA_Francis_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Francis_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Francis_PICKPOCKET_DoIt);
};
func void DIA_Francis_PICKPOCKET_DoIt()
{
	if (other.attribute[ATR_DEXTERITY] >= 40)
	{
		B_GiveInvItems (self,other , ITKE_Greg_ADDON_MIS, 1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GivePlayerXP (XP_Ambient);
		Info_ClearChoices (DIA_Francis_PICKPOCKET);
	}
	else
	{
		AI_StopProcessInfos	(self);
		B_Attack (self, other, AR_Theft, 1); //AR_Theft führt zu NEWS!
	};
	Info_ClearChoices (DIA_Francis_PICKPOCKET);
};
func void DIA_Francis_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Francis_PICKPOCKET);
};


// ************************************************************
// 			  		Wenn von Greg weggeschickt 
// ************************************************************
instance DIA_Francis_Ausgeschissen (C_INFO)
{
	npc			= PIR_1350_Addon_Francis;
	nr			= 900;
	condition	= DIA_Francis_Ausgeschissen_Condition;
	information	= DIA_Francis_Ausgeschissen_Info;
	permanent	= TRUE;
	important 	= TRUE;
};                       
func INT DIA_Francis_Ausgeschissen_Condition()
{
	if (Francis_ausgeschissen == TRUE)
	&& (Npc_IsInState(self, ZS_Talk))
	{
		return TRUE;
	};
};
func VOID DIA_Francis_Ausgeschissen_Info()
{	
	if (!Npc_IsDead(Greg))
	{
		AI_Output (self, other, "DIA_Addon_Francis_Ausgeschissen_13_00"); //Przez ciebie Greg kazał mi piłować deski, aż nie wykorzystam do tego wszystkich drzew na całej wyspie.
	};
	AI_Output (self, other, "DIA_Addon_Francis_Ausgeschissen_13_01"); //Idź sobie!
	AI_StopProcessInfos (self);
};



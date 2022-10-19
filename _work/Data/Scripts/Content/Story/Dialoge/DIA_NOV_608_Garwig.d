//**************************************************************************
//	Info EXIT 
//**************************************************************************
INSTANCE DIA_Garwig_EXIT   (C_INFO)
{
	npc         = Nov_608_Garwig;
	nr          = 999;
	condition   = DIA_Garwig_EXIT_Condition;
	information = DIA_Garwig_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Garwig_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Garwig_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// *************************************************************************
// 							Wurst verteilen
// *************************************************************************
INSTANCE DIA_Garwig_Wurst(C_INFO)
{
	npc         = Nov_608_Garwig;
	nr			= 3;
	condition	= DIA_Garwig_Wurst_Condition;
	information	= DIA_Garwig_Wurst_Info;
	permanent	= FALSE;
	description = "Chcesz spróbowaæ kie³basy?";
};                       

FUNC INT DIA_Garwig_Wurst_Condition()
{
	if (Kapitel == 1)
	&& (MIS_GoraxEssen == LOG_RUNNING)
	&& (Npc_HasItems (self, ItFo_SchafsWurst ) == 0)
	&& (Npc_HasItems (other, ItFo_SchafsWurst ) >= 1)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Garwig_Wurst_Info()
{	
	AI_Output (other, self, "DIA_Garwig_Wurst_15_00"); //Chcesz spróbowaæ kie³basy?
	AI_Output (self, other, "DIA_Garwig_Wurst_06_01"); //Jest pyszna. Bardzo dziêkujê, Bracie.
	
	B_GiveInvItems (other, self, ItFo_SchafsWurst, 1);
	Wurst_Gegeben = (Wurst_Gegeben +1);
	
	CreateInvItems (self, ITFO_Sausage,1);
	B_UseItem (self, ITFO_Sausage);
	
	var string NovizeText;
	var string NovizeLeft;
	NovizeLeft = IntToString (13 - Wurst_Gegeben);
	NovizeText = ConcatStrings(NovizeLeft, PRINT_NovizenLeft);
	AI_PrintScreen	(NovizeText, -1, YPOS_GOLDGIVEN, FONT_ScreenSmall, 2);
};
//**************************************************************************
//	Info Hello 
//**************************************************************************
INSTANCE DIA_Garwig_Hello   (C_INFO)
{
	npc         = Nov_608_Garwig;
	nr          = 3;
	condition   = DIA_Garwig_Hello_Condition;
	information = DIA_Garwig_Hello_Info;
	permanent   = FALSE;
	important 	= TRUE;
};
FUNC INT DIA_Garwig_Hello_Condition()
{	
	if (other.guild == GIL_NOV)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Garwig_Hello_Info()
{
	AI_Output (self ,other,"DIA_Garwig_Hello_06_00"); //Niech Innos bêdzie z tob¹. Nie znam ciê, jesteœ tu nowy?
	AI_Output (other ,self,"DIA_Garwig_Hello_15_01"); //Tak, dopiero siê do was przy³¹czy³em.
	AI_Output (self ,other,"DIA_Garwig_Hello_06_02"); //W takim wypadku mam nadziejê, ¿e prêdko siê tutaj zadomowisz. Daj mi znaæ, jeœli bêdê móg³ ci w czymœ pomóc.
};
//**************************************************************************
//	Info Hello 
//**************************************************************************
INSTANCE DIA_Garwig_Room   (C_INFO)
{
	npc         = Nov_608_Garwig;
	nr          = 5;
	condition   = DIA_Garwig_Room_Condition;
	information = DIA_Garwig_Room_Info;
	permanent   = FALSE;
	description	= "Co to za pomieszczenie?";
};
FUNC INT DIA_Garwig_Room_Condition()
{	
		return TRUE;
};
FUNC VOID DIA_Garwig_Room_Info()
{
	AI_Output (other,self ,"DIA_Garwig_Room_15_00"); //Co to za pomieszczenie?
	AI_Output (self ,other,"DIA_Garwig_Room_06_01"); //Tutaj przechowywane s¹ klasztorne relikwie.
	AI_Output (other,self ,"DIA_Garwig_Room_15_02"); //Jakie relikwie?
	AI_Output (self ,other,"DIA_Garwig_Room_06_03"); //Tu spoczywa M³ot Innosa oraz Tarcza Ognia, najwa¿niejsze relikwie Koœcio³a Innosa poza stolic¹ królestwa.
};
//**************************************************************************
//	Info Hammer 
//**************************************************************************
INSTANCE DIA_Garwig_Hammer  (C_INFO)
{
	npc         = Nov_608_Garwig;
	nr          = 99;
	condition   = DIA_Garwig_Hammer_Condition;
	information = DIA_Garwig_Hammer_Info;
	permanent   = TRUE;
	description	= "Opowiedz mi o tym M³ocie.";
};
FUNC INT DIA_Garwig_Hammer_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Garwig_Room))
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Garwig_Hammer_Info()
{
	AI_Output (other,self ,"DIA_Garwig_Hammer_15_00"); //Opowiedz mi o tym M³ocie.
	AI_Output (self ,other,"DIA_Garwig_Hammer_06_01"); //Oto œwiêty M³ot Innosa. To w³aœnie nim Œwiêty Rhobar zabi³ Kamiennego Stra¿nika.
	AI_Output (self ,other,"DIA_Garwig_Hammer_06_02"); //Œwiête Pisma twierdz¹, ¿e Kamienny Stra¿nik by³ niezniszczalny. Broñ wyszczerbia³a siê na jego kamiennej skórze, nie czyni¹c mu ¿adnej krzywdy.
	AI_Output (self ,other,"DIA_Garwig_Hammer_06_03"); //Z imieniem Innosa na ustach Rhobar rzuci³ siê na potwora i zmia¿d¿y³ go jednym potê¿nym ciosem m³ota.
};
//**************************************************************************
//	Info Schild 
//**************************************************************************
INSTANCE DIA_Garwig_Shield  (C_INFO)
{
	npc         = Nov_608_Garwig;
	nr          = 98;
	condition   = DIA_Garwig_Shield_Condition;
	information = DIA_Garwig_Shield_Info;
	permanent   = FALSE;
	description	= "Opowiedz mi o tej Tarczy.";
};
FUNC INT DIA_Garwig_Shield_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Garwig_Room))
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Garwig_Shield_Info()
{
	AI_Output (other,self ,"DIA_Garwig_Shield_15_00"); //Opowiedz mi o tej Tarczy.
	AI_Output (self ,other,"DIA_Garwig_Shield_06_01"); //Tarcza Ognia zosta³a u¿yta przez Dominique w czasie bitwy na Po³udniowych Wyspach.
	AI_Output (self ,other,"DIA_Garwig_Shield_06_02"); //Nikt nie ma prawa korzystaæ z jej mocy - dlatego przybiliœmy j¹ do œciany.
};
//**************************************************************************
//	Info Auge Innos
//**************************************************************************
INSTANCE DIA_Garwig_Auge  (C_INFO)
{
	npc         = Nov_608_Garwig;
	nr          = 4;
	condition   = DIA_Garwig_Auge_Condition;
	information = DIA_Garwig_Auge_Info;
	permanent   = FALSE;
	description	= "Czy znajduje siê tutaj tak¿e Oko Innosa?";
};
FUNC INT DIA_Garwig_Auge_Condition()
{
	if Npc_KnowsInfo (other,DIA_Garwig_Room)
	&& (Kapitel <= 2)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Garwig_Auge_Info()
{
	AI_Output (other,self ,"DIA_Garwig_Auge_15_00"); //Czy znajduje siê tutaj tak¿e Oko Innosa?
	AI_Output (self ,other,"DIA_Garwig_Auge_06_01"); //Oczywiœcie, ¿e nie. Co za dziwaczny pomys³. Nikt nie wie, gdzie siê znajduje najœwiêtszy artefakt.
};
///////////////////////////////////////////////////////////////////////
//	Info SLEEP
///////////////////////////////////////////////////////////////////////
instance DIA_Garwig_SLEEP		(C_INFO)
{
	npc			 = 	Nov_608_Garwig;
	nr			 = 	23;
	condition	 = 	DIA_Garwig_SLEEP_Condition;
	information	 = 	DIA_Garwig_SLEEP_Info;
	permanent	 = 	TRUE;
	description	 = 	"Co tu porabiasz?";
};
func int DIA_Garwig_SLEEP_Condition ()
{
	if (other.guild == GIL_NOV)
	{
		return TRUE;
	};	
};
func void DIA_Garwig_SLEEP_Info ()
{
	AI_Output			(other, self, "DIA_Garwig_SLEEP_15_00"); //Czym siê tu zajmujesz?
	AI_Output			(self, other, "DIA_Garwig_SLEEP_06_01"); //Jestem stra¿nikiem œwiêtych artefaktów.
	
	Info_ClearChoices 	(DIA_Garwig_SLEEP);
	Info_AddChoice 		(DIA_Garwig_SLEEP,DIALOG_BACK,DIA_Garwig_SLEEP_BACK);
	Info_AddChoice 		(DIA_Garwig_SLEEP,"Chcesz, ¿ebym na moment ciê zast¹pi³?",DIA_Garwig_SLEEP_EXCHANGE);
	Info_AddChoice 		(DIA_Garwig_SLEEP,"Czemu te artefakty s¹ tak pilnie strze¿one?",DIA_Garwig_SLEEP_THIEF);
	Info_AddChoice 		(DIA_Garwig_SLEEP,"Czy ty nigdy nie sypiasz?",DIA_Garwig_SLEEP_NEVER);
};
FUNC VOID DIA_Garwig_SLEEP_BACK()
{
	Info_ClearChoices 	(DIA_Garwig_SLEEP);
};
FUNC VOID DIA_Garwig_SLEEP_EXCHANGE()
{
	AI_Output			(other, self, "DIA_Garwig_SLEEP_EXCHANGE_15_00"); //Chcesz, ¿ebym na moment ciê zast¹pi³?
	AI_Output			(self, other, "DIA_Garwig_SLEEP_EXCHANGE_06_01"); //Czy to jakaœ próba? Magowie ciê tu przys³ali, abyœ wystawi³ mnie na próbê, prawda? Och - wiedzia³em od pocz¹tku!
	AI_Output			(self, other, "DIA_Garwig_SLEEP_EXCHANGE_06_02"); //Ale ja siê nie ugnê. Powiedz swoim magom, ¿e stojê tu na stra¿y niewzruszony niczym kamienny pos¹g, opieraj¹c siê wszelkim pokusom, albowiem jestem godny tej zaszczytnej misji.
};
FUNC VOID DIA_Garwig_SLEEP_THIEF()
{
	AI_Output			(other, self, "DIA_Garwig_SLEEP_THIEF_15_00"); //Czemu te artefakty s¹ tak pilnie strze¿one? Czy istnieje jakieœ niebezpieczeñstwo, ¿e ktoœ chcia³by je ukraœæ?
	AI_Output			(self, other, "DIA_Garwig_SLEEP_THIEF_06_01"); //Co za niezwyk³y pomys³. Czemu ktoœ mia³by je ukraœæ?
	AI_Output			(self, other, "DIA_Garwig_SLEEP_THIEF_06_02"); //Tylko s³udzy Innosa maj¹ wstêp do klasztoru. Zapewniam ciê, ¿e ¿aden wyznawca nie odwa¿y³by siê na takie œwiêtokradztwo.
};
FUNC VOID DIA_Garwig_SLEEP_NEVER()
{
	AI_Output			(other, self, "DIA_Garwig_SLEEP_NEVER_15_00"); //Nigdy nie œpisz?
	AI_Output			(self, other, "DIA_Garwig_SLEEP_NEVER_06_01"); //Co za dziwne pytanie. Oczywiœcie, ¿e nigdy nie sypiam. Innos sprawia, ¿e nie potrzebujê snu.
	AI_Output			(self, other, "DIA_Garwig_SLEEP_NEVER_06_02"); //Jak inaczej móg³bym pe³niæ moje œwiête powo³anie stra¿nika?
	
	Info_ClearChoices 	(DIA_Garwig_SLEEP);
	Info_AddChoice (DIA_Garwig_SLEEP,"Naprawdê NIGDY nie sypiasz?",DIA_Garwig_SLEEP_AGAIN);
};
FUNC VOID DIA_Garwig_SLEEP_AGAIN()
{
	AI_Output			(other, self, "DIA_Garwig_SLEEP_AGAIN_15_00"); //Naprawdê NIGDY nie sypiasz?
	AI_Output			(self, other, "DIA_Garwig_SLEEP_AGAIN_06_01"); //Nie. Jeœli stra¿nik zapada w sen, oznacza to jego ca³kowit¹ pora¿kê.
	AI_Output			(self, other, "DIA_Garwig_SLEEP_AGAIN_06_02"); //Ale ja nie zawiodê, albowiem Innos zapewnia mi si³ê i wytrwa³oœæ, abym móg³ wiecznie trwaæ na posterunku.
	
	
};
///////////////////////////////////////////////////////////////////////
//	Info THIEF Der Hammer ist nicht mehr da
///////////////////////////////////////////////////////////////////////
instance DIA_Garwig_THIEF		(C_INFO)
{
	npc			 = 	Nov_608_Garwig;
	nr			 = 	2;
	condition	 = 	DIA_Garwig_THIEF_Condition;
	information	 = 	DIA_Garwig_THIEF_Info;
	permanent	 =  TRUE;
	important 	 = 	TRUE;
};
func int DIA_Garwig_THIEF_Condition ()
{	
	if  (Npc_IsInState (self, ZS_Talk))
	&&  (Npc_HasItems (hero, Holy_Hammer_MIS) == 1)
	{
		return TRUE;
	};
};
func void DIA_Garwig_THIEF_Info ()
{		
					
	if (Hammer_Taken == TRUE) 
	{ 
		AI_Output (self, other, "DIA_Garwig_THIEF_06_00"); //Z³odzieju! Zniewa¿y³eœ nie tylko mnie i siebie, lecz równie¿ ca³y ten klasztor!
		AI_Output (self, other, "DIA_Garwig_THIEF_06_01"); //Odpokutujesz za to œwiêtokradztwo. Ale przede wszystkim - ODDAJ MI TEN M£OT!!!
		
	}
	else
	{
		AI_Output (self, other, "DIA_Garwig_THIEF_06_02"); //M³ot znikn¹³ - jak to siê mog³o staæ?
		AI_Output (self, other, "DIA_Garwig_THIEF_06_03"); //Zawiod³em, i kara Innosa mnie nie ominie!
	};	
};
///////////////////////////////////////////////////////////////////////
//	Info Hammer zurückbringen (immer wenn Spieler den Hammer hat)
///////////////////////////////////////////////////////////////////////
instance DIA_Garwig_Abgeben		(C_INFO)
{
	npc			 = 	Nov_608_Garwig;
	nr			 = 	2;
	condition	 = 	DIA_Garwig_Abgeben_Condition;
	information	 = 	DIA_Garwig_Abgeben_Info;
	permanent	 = 	TRUE;
	description	 =  "Przyszed³em oddaæ ci twój M³ot.";
};
func int DIA_Garwig_Abgeben_Condition ()
{	
	if (Npc_HasItems (other, Holy_Hammer_MIS) >= 1)
	{
		return TRUE;
	};
};
func void DIA_Garwig_Abgeben_Info ()
{
	AI_Output (other, self, "DIA_Garwig_Abgeben_15_00"); //Przyszed³em oddaæ ci twój M³ot.
	
	if (Hammer_Taken == TRUE)
	{
		AI_Output (self, other, "DIA_Garwig_Abgeben_06_01"); //Ty wstrêtny z³odzieju!
	}
	else
	{
		AI_Output (self, other, "DIA_Garwig_Abgeben_06_02"); //A wiêc to ty mnie okrad³eœ...
	};
	AI_Output (self, other, "DIA_Garwig_Abgeben_06_03"); //Jednak nie mnie s¹dziæ twoje czyny. Innos bêdzie twym sêdzi¹ i zeœle na ciebie sprawiedliw¹ karê!
	
	B_GiveInvItems (other,self, Holy_Hammer_MIS,1);
	Hammer_Taken = FALSE;
};



// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Garwig_PICKPOCKET (C_INFO)
{
	npc			= Nov_608_Garwig;
	nr			= 900;
	condition	= DIA_Garwig_PICKPOCKET_Condition;
	information	= DIA_Garwig_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Garwig_PICKPOCKET_Condition()
{
	C_Beklauen (52, 80);
};
 
FUNC VOID DIA_Garwig_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Garwig_PICKPOCKET);
	Info_AddChoice		(DIA_Garwig_PICKPOCKET, DIALOG_BACK 		,DIA_Garwig_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Garwig_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Garwig_PICKPOCKET_DoIt);
};

func void DIA_Garwig_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Garwig_PICKPOCKET);
};
	
func void DIA_Garwig_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Garwig_PICKPOCKET);
};
















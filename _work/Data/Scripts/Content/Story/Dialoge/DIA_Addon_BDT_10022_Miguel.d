//--------------------------------------------------------------------
//	Info EXIT 
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Miguel_EXIT   (C_INFO)
{
	npc         = BDT_10022_Addon_Miguel;
	nr          = 999;
	condition   = DIA_Addon_Miguel_EXIT_Condition;
	information = DIA_Addon_Miguel_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Miguel_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Miguel_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Addon_Miguel_PICKPOCKET (C_INFO)
{
	npc			= BDT_10022_Addon_Miguel;
	nr			= 900;
	condition	= DIA_Addon_Miguel_PICKPOCKET_Condition;
	information	= DIA_Addon_Miguel_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Addon_Miguel_PICKPOCKET_Condition()
{
	C_Beklauen (40, 48);
};
 
FUNC VOID DIA_Addon_Miguel_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Miguel_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Miguel_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Miguel_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Miguel_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Miguel_PICKPOCKET_DoIt);
};

func void DIA_Addon_Miguel_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Miguel_PICKPOCKET);
};
	
func void DIA_Addon_Miguel_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Miguel_PICKPOCKET);
};
//---------------------------------------------------------------------
//	Info Hi
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Miguel_Hi   (C_INFO)
{
	npc         = BDT_10022_Addon_Miguel;
	nr          = 1;
	condition   = DIA_Addon_Miguel_Hi_Condition;
	information = DIA_Addon_Miguel_Hi_Info;
	permanent   = FALSE;
	description = "Co tu robisz?";
};
FUNC INT DIA_Addon_Miguel_Hi_Condition()
{		
	return TRUE;
};
FUNC VOID DIA_Addon_Miguel_Hi_Info()
{
	AI_Output (other, self, "DIA_Addon_Miguel_Hi_15_00");//Co tu robisz?
	
	if Wld_IsTime (06,00,22,00)
	{
		AI_Output (other, self, "DIA_Addon_Miguel_Hi_15_01");//Szukasz czegoś?
		AI_Output (self, other, "DIA_Addon_Miguel_Hi_11_02");//Roślin - szukam roślin.
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Miguel_Hi_11_03");//Zwykle szukam roślin.
	};
	AI_Output (self, other, "DIA_Addon_Miguel_Hi_11_04");//Większość tego, co tu rośnie, można wykorzystać.
	AI_Output (self, other, "DIA_Addon_Miguel_Hi_11_05");//Wiele ziół ma właściwości lecznicze, a bagienne ziele można palić.
	AI_Output (self, other, "DIA_Addon_Miguel_Hi_11_06");//Zanim umieścili mnie za barierą, pracowałem u alchemika.
};
//---------------------------------------------------------------------
//	Info Story
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Miguel_Story   (C_INFO)
{
	npc         = BDT_10022_Addon_Miguel;
	nr          = 2;
	condition   = DIA_Addon_Miguel_Story_Condition;
	information = DIA_Addon_Miguel_Story_Info;
	permanent   = FALSE;
	description = "Za co cię zamknęli za barierą?";
};
FUNC INT DIA_Addon_Miguel_Story_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Miguel_Hi)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Miguel_Story_Info()
{
	AI_Output (other, self, "DIA_Addon_Miguel_Story_15_00");//Za co cię zamknęli za barierą?
	AI_Output (self, other, "DIA_Addon_Miguel_Story_11_01");//Eksperymentowałem z różnymi miksturami, które wpływają na umysł i pozwalają nim manipulować.
	AI_Output (self, other, "DIA_Addon_Miguel_Story_11_02");//Ignaz, mój mistrz, wypił kiedyś jeden z moich "eksperymentów" zamiast wina.
	AI_Output (self, other, "DIA_Addon_Miguel_Story_11_03");//No... zaczął się zachowywać... nieco irracjonalnie. Od tamtej pory jest... troszkę niezrównoważony.
	AI_Output (self, other, "DIA_Addon_Miguel_Story_11_04");//Magowie zesłali mnie do kolonii karnej za "prowadzenie badań w zakazanej dziedzinie".
};

//---------------------------------------------------------------------
//	LAGER
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Miguel_Lager   (C_INFO)
{
	npc         = BDT_10022_Addon_Miguel;
	nr          = 3;
	condition   = DIA_Addon_Miguel_Lager_Condition;
	information = DIA_Addon_Miguel_Lager_Info;
	permanent   = FALSE;
	description = "Co możesz mi powiedzieć o obozowisku?";
};
FUNC INT DIA_Addon_Miguel_Lager_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Miguel_Lager_Info()
{
	AI_Output (other, self, "DIA_Addon_Miguel_Lager_15_00"); //Co możesz mi powiedzieć o obozowisku?
	AI_Output (self, other, "DIA_Addon_Miguel_Lager_11_01"); //Niewiele. Nigdy tam nie byłem.
	AI_Output (self, other, "DIA_Addon_Miguel_Lager_11_02"); //Tylko ludzie Kruka byli tam od początku. Wszyscy pozostali przyszli później albo wciąż czekają na przyjęcie. Tak jak ja.
};

//-----------------------------------------
//	Woher
//-----------------------------------------
instance DIA_Addon_Miguel_WhereFrom (C_INFO)
{
	npc         = BDT_10022_Addon_Miguel;
	nr          = 4;
	condition   = DIA_Addon_Miguel_WhereFrom_Condition;
	information = DIA_Addon_Miguel_WhereFrom_Info;
	permanent   = FALSE;
	description = "Jak się tu dostałeś?";
};
FUNC INT DIA_Addon_Miguel_WhereFrom_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Addon_Miguel_Hi)
	|| Npc_KnowsInfo (other,DIA_Addon_Miguel_Lager)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Miguel_WhereFrom_Info()
{
	AI_Output (other, self, "DIA_Addon_Miguel_WhereFrom_15_00"); //Jak się tu dostałeś?
	AI_Output (self, other, "DIA_Addon_Miguel_WhereFrom_11_01"); //Myślę, że tą samą drogą co ty. Z piratami przez morze.
	AI_Output (self, other, "DIA_Addon_Miguel_WhereFrom_11_02"); //Ta dolina jest niedostępna z wyspy. Można się do niej dostać tylko morzem.
	AI_Output (other, self, "DIA_Addon_Miguel_WhereFrom_15_03"); //Dokładnie.
};

//-----------------------------------------
//	Angefordert
//-----------------------------------------
instance DIA_Addon_Miguel_Angefordert (C_INFO)
{
	npc         = BDT_10022_Addon_Miguel;
	nr          = 4;
	condition   = DIA_Addon_Miguel_Angefordert_Condition;
	information = DIA_Addon_Miguel_Angefordert_Info;
	permanent   = FALSE;
	description = "Kiedy zwykle potrzebują nowych ludzi?";
};
FUNC INT DIA_Addon_Miguel_Angefordert_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Addon_Miguel_Lager)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Miguel_Angefordert_Info()
{
	AI_Output (other, self, "DIA_Addon_Miguel_Angefordert_15_00"); //Kiedy zwykle potrzebują nowych ludzi?
	AI_Output (self, other, "DIA_Addon_Miguel_Angefordert_11_01"); //Gdy jest ich za mało...
	AI_Output (self, other, "DIA_Addon_Miguel_Angefordert_11_02"); //Gdy kogoś zabije kopalniany pełzacz, potrzebują drugiego na wymianę.
	AI_Output (self, other, "DIA_Addon_Miguel_Angefordert_11_03"); //No i czasem chłopaki się pozabijają. Ale ostatnio nie jest tak źle.
	AI_Output (self, other, "DIA_Addon_Miguel_Angefordert_11_04"); //Kruk zdołał to jakoś zorganizować i pilnuje, żeby w kopalni nie pracowali wszyscy naraz.
	AI_Output (self, other, "DIA_Addon_Miguel_Angefordert_11_05"); //Nie mam pojęcia, jak to dokładnie funkcjonuje. Nigdy tam nie byłem.
};

//---------------------------------------------------------------------
//	Info Fortuno
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Miguel_Fortuno   (C_INFO)
{
	npc         = BDT_10022_Addon_Miguel;
	nr          = 6;
	condition   = DIA_Addon_Miguel_Fortuno_Condition;
	information = DIA_Addon_Miguel_Fortuno_Info;
	permanent   = FALSE;
	description = "Fortuno sprawia wrażenie obłąkanego.";
};
FUNC INT DIA_Addon_Miguel_Fortuno_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Addon_Fortuno_FREE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Miguel_Fortuno_Info()
{
	AI_Output (other, self, "DIA_Addon_Miguel_Fortuno_15_00");//Fortuno sprawia wrażenie obłąkanego. Myślę, że jakaś mikstura może przywrócić mu pamięć.
	AI_Output (self, other, "DIA_Addon_Miguel_Fortuno_11_01");//Fortuno? To jeden ze służących Kruka.
	AI_Output (other, self, "DIA_Addon_Miguel_Fortuno_15_02");//Teraz to tylko wrak. A wszystko z winy Kruka.
	AI_Output (self, other, "DIA_Addon_Miguel_Fortuno_11_03");//Kruk. Nigdy o nim wiele nie myślałem. Hmm, dobra. Niestety, nie mogę warzyć mikstur tutaj, na bagnach.
	AI_Output (other, self, "DIA_Addon_Miguel_Fortuno_15_04");//Mógłbym przyrządzić miksturę. W obozie jest odpowiedni stół. Gdybym tylko miał przepis...
	AI_Output (self, other, "DIA_Addon_Miguel_Fortuno_11_05");//Lepiej bądź ostrożny z tym przepisem. Warzenie mikstur to niebezpieczne zajęcie.
	B_GiveInvItems (self, other, ITWr_Addon_MCELIXIER_01,1);
	AI_Output (self, other, "DIA_Addon_Miguel_Fortuno_11_06");//Jeżeli użyjesz nieodpowiednich składników albo coś pójdzie nie tak, mikstura będzie śmiertelną trucizną.
	AI_Output (other, self, "DIA_Addon_Miguel_Fortuno_15_07");//Będę uważał.
	
	B_LogEntry (Topic_Addon_Fortuno,"Miguel dał mi przepis na miksturę, która ma pomóc Fortuna w odzyskaniu pamięci. Powinienem przyrządzić ją dopiero wtedy, gdy dobrze poznam działanie wszystkich składników. Inaczej może być zabójcza.");
};

//---------------------------------------------------------------------
//	Info BRAU
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Miguel_BRAU   (C_INFO)
{
	npc         = BDT_10022_Addon_Miguel;
	nr          = 7;
	condition   = DIA_Addon_Miguel_BRAU_Condition;
	information = DIA_Addon_Miguel_BRAU_Info;
	permanent   = FALSE;
	description = "Możesz mnie czegoś nauczyć?";
};
FUNC INT DIA_Addon_Miguel_BRAU_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Addon_Miguel_Story)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Miguel_BRAU_Info()
{
	AI_Output (other, self, "DIA_Addon_Miguel_BRAU_15_00");//Możesz mnie czegoś nauczyć?
	AI_Output (self, other, "DIA_Addon_Miguel_BRAU_11_01");//Nie mam na to czasu. Przyszedłem tu zdobyć trochę złota. Na razie, dopóki nie wpuszczą mnie do obozowiska, zarabiam na handlu ziołami.
	AI_Output (self, other, "DIA_Addon_Miguel_BRAU_11_02");//Mogę jednak zaopatrzyć cię w mikstury.
	
	Log_CreateTopic (Topic_Addon_BDT_Trader,LOG_NOTE);
	B_LogEntry (Topic_Addon_BDT_Trader,"Od Miguela mogę kupić rośliny i mikstury.");
};

//---------------------------------------------------------------------
//	Info trade
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Miguel_trade   (C_INFO)
{
	npc         = BDT_10022_Addon_Miguel;
	nr          = 888;
	condition   = DIA_Addon_Miguel_trade_Condition;
	information = DIA_Addon_Miguel_trade_Info;
	permanent   = TRUE;
	trade		= TRUE;
	description = DIALOG_TRADE;
};
FUNC INT DIA_Addon_Miguel_trade_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Addon_Miguel_BRAU)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Miguel_trade_Info()
{
	B_Say (other,self,"$TRADE_1");
	B_GiveTradeInv(self);
};




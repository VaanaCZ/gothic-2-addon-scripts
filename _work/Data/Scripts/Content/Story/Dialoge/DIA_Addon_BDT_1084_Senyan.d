//----------------------------------------------------------------------
//	Info EXIT 
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Senyan_EXIT   (C_INFO)
{
	npc         = BDT_1084_Addon_Senyan;
	nr          = 999;
	condition   = DIA_Addon_Senyan_EXIT_Condition;
	information = DIA_Addon_Senyan_EXIT_Info;
	permanent   = TRUE;
	description = "To do zobaczenia...";
};
FUNC INT DIA_Addon_Senyan_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Senyan_EXIT_Info()
{
	if (Senyan_Erpressung == LOG_RUNNING)
	{
		AI_Output (self, other, "DIA_Addon_Senyan_EXIT_12_00");//Wiesz co robiæ....
	};
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Addon_Senyan_PICKPOCKET (C_INFO)
{
	npc			= BDT_1084_Addon_Senyan;
	nr			= 900;
	condition	= DIA_Addon_Senyan_PICKPOCKET_Condition;
	information	= DIA_Addon_Senyan_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Addon_Senyan_PICKPOCKET_Condition()
{
	C_Beklauen (45, 88);
};
 
FUNC VOID DIA_Addon_Senyan_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Senyan_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Senyan_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Senyan_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Senyan_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Senyan_PICKPOCKET_DoIt);
};

func void DIA_Addon_Senyan_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Senyan_PICKPOCKET);
};
	
func void DIA_Addon_Senyan_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Senyan_PICKPOCKET);
};
//----------------------------------------------------------------------
FUNC VOID B_Senyan_Attack()
{
	AI_Output (self, other, "DIA_Addon_Senyan_Attack_12_00");//Do czego móg³byœ mi siê przydaæ?
	AI_Output (self, other, "DIA_Addon_Senyan_Attack_12_01");//Hej, ch³opaki, patrzcie, kogo tu mamy!
	
	Senyan_Called = TRUE;	
	Senyan_Erpressung = LOG_OBSOLETE;
	B_CheckLog();
	
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_NONE,1);
}; 
//----------------------------------------------------------------------
FUNC VOID B_Senyan_Erpressung()
{
	AI_Output (other, self, "DIA_Addon_Senyan_Erpressung_15_00");//Ile chcesz?
	AI_Output (self, other, "DIA_Addon_Senyan_Erpressung_12_01");//Och, nie. Nigdy bym nie pomyœla³, ¿eby ciê szanta¿owaæ, sk¹d....
	AI_Output (other, self, "DIA_Addon_Senyan_Erpressung_15_02");//Ile?
	AI_Output (self, other, "DIA_Addon_Senyan_Erpressung_12_03");//Nie tak dawno temu ktoœ próbowa³ zabiæ Estebana. Jednak zgin¹³ z r¹k stra¿ników.
	AI_Output (self, other, "DIA_Addon_Senyan_Erpressung_12_04");//IdŸ do Estabana i porozmawiaj z nim. Potem utniemy sobie pogawêdkê.
	
	AI_StopProcessInfos (self);
	Log_CreateTopic (Topic_Addon_Senyan,LOG_MISSION);
	Log_SetTopicStatus (Topic_Addon_Senyan,LOG_RUNNING);
	B_LogEntry (Topic_Addon_Senyan,"Senyan mnie rozpozna³. Wie, kim jestem. Zamierza to wykorzystaæ do w³asnych celów. Coœ knuje i chce, ¿ebym porozmawia³ z Estebanem.");
};
//----------------------------------------------------------------------
//	Info Hi
//----------------------------------------------------------------------
INSTANCE DIA_Addon_BDT_1084_Senyan_Hi   (C_INFO)
{
	npc         = BDT_1084_Addon_Senyan;
	nr          = 1;
	condition   = DIA_Addon_Senyan_Hi_Condition;
	information = DIA_Addon_Senyan_Hi_Info;
	permanent   = FALSE;
	Important 	= TRUE;
};
FUNC INT DIA_Addon_Senyan_Hi_Condition()
{	
	return TRUE;
};
//--------------------
var int Senyan_Msg;
var int Senyan_Bad;
var int Senyan_Good;
//--------------------
FUNC VOID DIA_Addon_Senyan_Hi_Info()
{	
	
	AI_Output (self, other, "DIA_Addon_BDT_1084_Senyan_Hi_12_00");//Ach. Kogo my tu mamy?
	B_UseFakeScroll();
	AI_Output (self, other, "DIA_Addon_BDT_1084_Senyan_Hi_12_01");//Patrzcie, patrzcie, to ty. Mam dla ciebie trochê dobrych i z³ych wieœci.
	
	Info_ClearChoices (DIA_Addon_BDT_1084_Senyan_Hi);
	Info_AddChoice (DIA_Addon_BDT_1084_Senyan_Hi,"Najpierw chcê us³yszeæ te dobre.",DIA_Addon_BDT_1084_Senyan_Hi_good);
	Info_AddChoice (DIA_Addon_BDT_1084_Senyan_Hi,"Chcê najpierw us³yszeæ z³¹ wiadomoœæ.",DIA_Addon_BDT_1084_Senyan_Hi_bad);
};
FUNC VOID DIA_Addon_BDT_1084_Senyan_Hi_good()
{
	if (Senyan_Msg == FALSE)
	{
		AI_Output (other, self, "DIA_Addon_BDT_1084_Senyan_Hi_good_15_00");//Najpierw chcê us³yszeæ te dobre.
		Senyan_Msg = TRUE;
	}
	else
	{
		AI_Output (other, self, "DIA_Addon_BDT_1084_Senyan_Hi_good_15_01");//A jaka jest dobra wiadomoœæ?
	};
	AI_Output (self, other, "DIA_Addon_BDT_1084_Senyan_Hi_good_12_02");//Nie wiem dlaczego, ale z pewnoœci¹ masz tu teraz wp³ywowych wrogów
	AI_Output (self, other, "DIA_Addon_BDT_1084_Senyan_Hi_good_12_03");//Cieszê siê, ¿e to JA ciê rozpozna³em, a nie ktoœ inny.
	AI_Output (self, other, "DIA_Addon_BDT_1084_Senyan_Hi_good_12_04");//Jestem cz³owiekiem pe³nym zrozumienia, który potrafi ¿yæ w spo³ecznoœci.
	
	
	Senyan_Good = TRUE;
	
	Info_ClearChoices (DIA_Addon_BDT_1084_Senyan_Hi);
	
	if (Senyan_Bad == TRUE)
	{
		B_Senyan_Erpressung();
	}
	else 
	{
		Info_AddChoice (DIA_Addon_BDT_1084_Senyan_Hi,"A jaka jest z³a wiadomoœæ?",DIA_Addon_BDT_1084_Senyan_Hi_bad);
	};
};
FUNC VOID DIA_Addon_BDT_1084_Senyan_Hi_bad()
{
	if (Senyan_Msg == FALSE)
	{
		AI_Output (other, self, "DIA_Addon_BDT_1084_Senyan_Hi_bad_15_00");//Chcê najpierw us³yszeæ z³¹ wiadomoœæ.
		Senyan_Msg = TRUE;
	}
	else
	{
		AI_Output (other, self, "DIA_Addon_BDT_1084_Senyan_Hi_bad_15_01");//A jaka jest z³a wiadomoœæ?
	};
	AI_Output (self, other, "DIA_Addon_BDT_1084_Senyan_Hi_bad_12_02");//Kruk ciê szuka. Jego stra¿nicy te¿. W zasadzie wszyscy bandyci...
	AI_Output (self, other, "DIA_Addon_BDT_1084_Senyan_Hi_bad_12_03");//Jeœli siê na nich natkniesz, zabij¹ ciê.
	AI_Output (other, self, "DIA_Addon_BDT_1084_Senyan_Hi_bad_15_04");//Wielu ju¿ próbowa³o.
	AI_Output (self, other, "DIA_Addon_BDT_1084_Senyan_Hi_bad_12_05");//Twoja sprawnoœæ w walce dorównuje przebieg³oœci. Zak³adaj¹c jeden z naszych pancerzy i przychodz¹c do obozu...
	AI_Output (self, other, "DIA_Addon_BDT_1084_Senyan_Hi_bad_12_06");//...zachowa³eœ siê jak owca wstêpuj¹ca miêdzy wilki. St¹pasz po grz¹skim gruncie, panie ryzykancie.
	
	Senyan_Bad = TRUE;
	
	Info_ClearChoices (DIA_Addon_BDT_1084_Senyan_Hi);
	
	if (Senyan_Good == TRUE)
	{
		B_Senyan_Erpressung();
	}
	else 
	{
		Info_AddChoice (DIA_Addon_BDT_1084_Senyan_Hi,"A jaka jest dobra wiadomoœæ?",DIA_Addon_BDT_1084_Senyan_Hi_good);
	};
};
//---------------------------------------------------------------------
//	Info unterwegs
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Senyan_unterwegs   (C_INFO)
{
	npc         = BDT_1084_Addon_Senyan;
	nr          = 99;
	condition   = DIA_Addon_Senyan_unterwegs_Condition;
	information = DIA_Addon_Senyan_unterwegs_Info;
	permanent   = TRUE;
	description	= "A co do Estebana....";
};
FUNC INT DIA_Addon_Senyan_unterwegs_Condition()
{	
	if (MIS_Judas != LOG_RUNNING)
	&& Npc_KnowsInfo (other,DIA_Addon_BDT_1084_Senyan_Hi)
	{	
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Senyan_unterwegs_Info()
{
	AI_Output (other, self, "DIA_Addon_Senyan_unterwegs_15_00");//A co do Estebana....
	AI_Output (self, other, "DIA_Addon_Senyan_unterwegs_12_01");//Rozmawia³eœ ju¿ z nim?
	AI_Output (other, self, "DIA_Addon_Senyan_unterwegs_15_02");//Jeszcze nie.
	AI_Output (self, other, "DIA_Addon_Senyan_unterwegs_12_03");//Nie zwlekaj zbyt d³ugo.
};
//---------------------------------------------------------------------
//	Info Attentat
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Senyan_Attentat   (C_INFO)
{
	npc         = BDT_1084_Addon_Senyan;
	nr          = 2;
	condition   = DIA_Addon_Senyan_Attentat_Condition;
	information = DIA_Addon_Senyan_Attentat_Info;
	permanent   = FALSE;
	description	= "Ju¿ z nim rozmawia³em.";
};
FUNC INT DIA_Addon_Senyan_Attentat_Condition()
{	
	if (MIS_Judas == LOG_RUNNING)
	&& Npc_KnowsInfo (other,DIA_Addon_BDT_1084_Senyan_Hi)
	{	
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Senyan_Attentat_Info()
{
	AI_Output (other, self, "DIA_Addon_Senyan_Attentat_15_00");//Ju¿ z nim rozmawia³em.
	AI_Output (self, other, "DIA_Addon_Senyan_Attentat_12_01");//Wspomina³ coœ o próbie zabójstwa?
	AI_Output (other, self, "DIA_Addon_Senyan_Attentat_15_02");//Mam siê dowiedzieæ, kto za tym stoi. Wiesz coœ o tej sprawie?
	AI_Output (self, other, "DIA_Addon_Senyan_Attentat_12_03");//Niewiele wiêcej ni¿ ty. Sam szukam tego cz³owieka. Ale najbardziej interesuj¹ce jest to...
	AI_Output (other, self, "DIA_Addon_Senyan_Attentat_15_04");//Zamieniam siê w s³uch.
	AI_Output (self, other, "DIA_Addon_Senyan_Attentat_12_05");//Chcê, ¿ebyœ dobrze wykona³ swoje zdanie. Masz znaleŸæ zdrajcê.
	AI_Output (self, other, "DIA_Addon_Senyan_Attentat_12_06");//A gdy go znajdziesz, zabij go - dla mnie.
	AI_Output (self, other, "DIA_Addon_Senyan_Attentat_12_07");//Nagroda przypadnie MNIE.
	AI_Output (self, other, "DIA_Addon_Senyan_Attentat_12_08");//Nie zapominaj, ¿e mam list goñczy na ciebie. Rób swoje i spraw siê dobrze. Wiesz, co stanie siê w przeciwnym wypadku.

	Info_ClearChoices (DIA_Addon_Senyan_Attentat);
	Info_AddChoice (DIA_Addon_Senyan_Attentat,"Wygl¹da na to, ¿e nie mam wyboru...",DIA_Addon_Senyan_Attentat_JA);
	Info_AddChoice (DIA_Addon_Senyan_Attentat,"Nie ma mowy!",DIA_Addon_Senyan_Attentat_NO);
};
FUNC VOID DIA_Addon_Senyan_Attentat_NO()
{
	AI_Output (other, self, "DIA_Addon_Senyan_Attentat_NO_15_00");//Nie ma mowy!

	B_Senyan_Attack();
	Info_ClearChoices (DIA_Addon_Senyan_Attentat);
};
FUNC VOID DIA_Addon_Senyan_Attentat_JA()
{
	AI_Output (other, self, "DIA_Addon_Senyan_Attentat_JA_15_00");//Wygl¹da na to, ¿e nie mam wyboru...
	AI_Output (self, other, "DIA_Addon_Senyan_Attentat_JA_12_01");//Wiedzia³em, ¿e dojdziemy do porozumienia.
	AI_Output (self, other, "DIA_Addon_Senyan_Attentat_JA_12_02");//Gdy dowiesz siê, kto to jest, razem zabijemy drania. A teraz zje¿d¿aj!
	
	Senyan_Erpressung = LOG_RUNNING;
	Info_ClearChoices (DIA_Addon_Senyan_Attentat);
	
	B_LogEntry (Topic_Addon_Senyan,"Senyan chce, ¿ebym znalaz³ i zabi³ spiskowca, a sam zabierze nagrodê.");
};

//----------------------------------------------------------------------
//	Anders Überlegt
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Senyan_ChangePlan   (C_INFO)
{
	npc         = BDT_1084_Addon_Senyan;
	nr          = 3;
	condition   = DIA_Addon_Senyan_ChangePlan_Condition;
	information = DIA_Addon_Senyan_ChangePlan_Info;
	permanent   = FALSE;
	description = "Zastanowi³em siê nad tym. Nie chcê z tob¹ wspó³pracowaæ!";
};
FUNC INT DIA_Addon_Senyan_ChangePlan_Condition()
{	
	if (Senyan_Erpressung == LOG_RUNNING)
	&& (Snaf_Tip_Senyan == TRUE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Senyan_ChangePlan_Info()
{	
	AI_Output (other, self, "DIA_Addon_Senyan_ChangePlan_15_00"); //Zastanowi³em siê nad tym. Nie chcê z tob¹ wspó³pracowaæ!
	B_Senyan_Attack(); 
			
	AI_StopProcessInfos (self);
};		

//----------------------------------------------------------------------
//	Erpressung Found Fisk
//----------------------------------------------------------------------
INSTANCE DIA_Addon_BDT_1084_Senyan_Found   (C_INFO)
{
	npc         = BDT_1084_Addon_Senyan;
	nr          = 3;
	condition   = DIA_Addon_Senyan_Found_Condition;
	information = DIA_Addon_Senyan_Found_Info;
	permanent   = FALSE;
	description = "Znalaz³em zdrajcê. To Fisk. ";
};
FUNC INT DIA_Addon_Senyan_Found_Condition()
{	
	if (Senyan_Erpressung == LOG_RUNNING)
	&& (MIS_Judas == LOG_SUCCESS)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Senyan_Found_Info()
{	
	AI_Output (other, self, "DIA_Addon_BDT_1084_Senyan_Found_15_00");//Znalaz³em zdrajcê. To Fisk.
	B_Senyan_Attack(); 
};		
//----------------------------------------------------------------------
//	Erpressung derbe
//----------------------------------------------------------------------
INSTANCE DIA_Addon_BDT_1084_Senyan_derbe   (C_INFO)
{
	npc         = BDT_1084_Addon_Senyan;
	nr          = 1;
	condition   = DIA_Addon_Senyan_derbe_Condition;
	information = DIA_Addon_Senyan_derbe_Info;
	permanent   = FALSE;
	important   = TRUE;
};
FUNC INT DIA_Addon_Senyan_derbe_Condition()
{	
	if (Senyan_Erpressung == LOG_RUNNING)
	&& (MIS_Judas == LOG_SUCCESS)
	&& (Npc_IsDead (Fisk)
	|| Npc_IsDead (Esteban))
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Senyan_derbe_Info()
{	
	AI_Output (self, other, "DIA_Addon_BDT_1084_Senyan_derbe_12_00");//Z³ama³eœ umowê.
	
	B_Senyan_Attack();		
};


	



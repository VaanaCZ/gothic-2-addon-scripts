///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Borka_EXIT   (C_INFO)
{
	npc         = VLK_434_Borka;
	nr          = 999;
	condition   = DIA_Borka_EXIT_Condition;
	information = DIA_Borka_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Borka_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Borka_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Borka_PICKPOCKET (C_INFO)
{
	npc			= VLK_434_Borka;
	nr			= 900;
	condition	= DIA_Borka_PICKPOCKET_Condition;
	information	= DIA_Borka_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80;
};                       

FUNC INT DIA_Borka_PICKPOCKET_Condition()
{
	C_Beklauen (80, 120);
};
 
FUNC VOID DIA_Borka_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Borka_PICKPOCKET);
	Info_AddChoice		(DIA_Borka_PICKPOCKET, DIALOG_BACK 		,DIA_Borka_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Borka_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Borka_PICKPOCKET_DoIt);
};

func void DIA_Borka_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Borka_PICKPOCKET);
};
	
func void DIA_Borka_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Borka_PICKPOCKET);
};
///////////////////////////////////////////////////////////////////////
//	Info PISSOF
///////////////////////////////////////////////////////////////////////
instance DIA_Borka_PISSOFF		(C_INFO)
{
	npc			 = 	VLK_434_Borka;
	condition	 = 	DIA_Borka_PISSOFF_Condition;
	information	 = 	DIA_Borka_PISSOFF_Info;
	important	 = 	TRUE;
	permanent	 =  FALSE;
};
func int DIA_Borka_PISSOFF_Condition ()
{
	if (Knows_Borka_Dealer != TRUE)
	&& (Npc_GetDistToNpc(self, other) <= ZivilAnquatschDist)
	{
		return TRUE;
	};
};
func void DIA_Borka_PISSOFF_Info ()
{
	AI_Output (self, other,"DIA_Borka_PISSOFF_11_00");  //Hej, ty! Jak se vede? Nezáleží na tom, co máš v plánu - na to bude dost času pozdęji.
	AI_Output (self, other,"DIA_Borka_PISSOFF_11_01");  //Stojíš pâímo pâed perlou Khorinidu - ČERVENOU LUCERNOU. Je to ten nejkrásnęjší nevęstinec v celé Myrtanę, to si piš!
	AI_Output (self, other,"DIA_Borka_PISSOFF_11_02");  //Kotví tu námoâníci ze všech koutů zemę, jen aby tu mohli strávit pár nocí.
	AI_Output (self, other,"DIA_Borka_PISSOFF_11_03");  //A teë máš tuhle šanci - ne, čest - právę ty! Můžeš strávit noc s Nadjou, nejvášnivęjším kvętem, jaký kdy bohové stvoâili!
	AI_Output (self, other,"DIA_Borka_PISSOFF_11_04");  //Pojë dál a užij si to, o čem se jiným ani nesnilo!
	
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info TROUBLE
///////////////////////////////////////////////////////////////////////
instance DIA_Borka_TROUBLE		(C_INFO)
{
	npc			 = 	VLK_434_Borka;
	nr 			 =  3;
	condition	 = 	DIA_Borka_TROUBLE_Condition;
	information	 = 	DIA_Borka_TROUBLE_Info;
	permanent	 =  TRUE;
	important	 =  TRUE;
};

func int DIA_Borka_TROUBLE_Condition ()
{	
	if Npc_IsInState (self, ZS_Talk)
	&& (MIS_Andre_REDLIGHT != LOG_RUNNING) 
	&& (Npc_IsDead (Nadja) == FALSE) 
	&& (Npc_GetDistToWP (self, "NW_CITY_HABOUR_PUFF_ENTRANCE") <= 500)
	{	
		return TRUE;
	};
};
func void DIA_Borka_TROUBLE_Info ()
{
	AI_Output (self, other, "DIA_Borka_TROUBLE_11_00"); //Proč postáváš takhle stranou? Pojë dál a uvidíš naši vášnivou Nadju.
	AI_Output (self, other, "DIA_Borka_TROUBLE_11_01"); //Plameny, které v tobę tahle noční bytost zažehne, dají tvému životu nový smysl!
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info Smoke
///////////////////////////////////////////////////////////////////////
instance DIA_Borka_Smoke		(C_INFO)
{
	npc			 = 	VLK_434_Borka;
	nr 			 =  3;
	condition	 = 	DIA_Borka_Smoke_Condition;
	information	 = 	DIA_Borka_Smoke_Info;
	permanent	 =  TRUE;
	description	 =  "Nevíš, kde bych sehnal nęco ke kouâení?";
};

func int DIA_Borka_Smoke_Condition ()
{	
	if  (MIS_Andre_REDLIGHT == LOG_RUNNING) 
	&&  (Knows_Borka_Dealer == FALSE)
	{	
		return TRUE;
	};
};
func void DIA_Borka_Smoke_Info ()
{
	AI_Output (other, self, "DIA_Borka_Smoke_15_00"); //Nevíš, kde bych si mohl koupit nęjaké kuâivo - trávu nebo nęco takového?
	AI_Output (self, other, "DIA_Borka_Smoke_11_01"); //Ne, jdi do hajzlu.
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info BUYHERB
///////////////////////////////////////////////////////////////////////
instance DIA_Borka_BUYHERB		(C_INFO)
{
	npc			 = 	VLK_434_Borka;
	nr			 = 	2;
	condition	 = 	DIA_Borka_BUYHERB_Condition;
	information	 = 	DIA_Borka_BUYHERB_Info;
	permanent 	 =  TRUE;
	description	 = 	"Slyšel jsem, že prodáváš trávu.";
};
func int DIA_Borka_BUYHERB_Condition ()
{
	if (Knows_Borka_Dealer == TRUE)
	&& (MIS_Andre_REDLIGHT == LOG_RUNNING) 
	&& (Borka_Deal == FALSE)
	&& (Undercover_Failed == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Borka_BUYHERB_Info ()
{
	var C_ITEM heroArmor; heroArmor = Npc_GetEquippedArmor(other);
	
	AI_Output (other, self, "DIA_Borka_BUYHERB_15_00"); //Slyšel jsem, že prodáváš drogy.
	
	if (Hlp_IsItem (heroArmor, ItAR_MIl_L) == TRUE) 
	{
		AI_Output (self, other, "DIA_Borka_BUYHERB_11_01"); //Je mi líto, pane strážník. To musí být nęjaká mýlka, o žádných drogách nic nevím.
	}
	else
	{
		AI_Output (self, other, "DIA_Borka_BUYHERB_11_02"); //To âíká kdo?
	
		Info_ClearChoices 	(DIA_Borka_BUYHERB);
		Info_AddChoice		(DIA_Borka_BUYHERB,"Na tom až tak nezáleží.",DIA_Borka_BUYHERB_Egal);
		Info_AddChoice		(DIA_Borka_BUYHERB,"Nadja.",DIA_Borka_BUYHERB_Nadja);
	};
};
FUNC VOID DIA_Borka_BUYHERB_Egal ()
{
	AI_Output	(other, self, "DIA_Borka_BUYHERB_Egal_15_00"); //To sem nepatâí.
	AI_Output	(self, other, "DIA_Borka_BUYHERB_Egal_11_01"); //Jenom chci vędęt, kdo tę posílá, abych męl jistotu, že jsi v poâádku.
	
	Info_ClearChoices 	(DIA_Borka_BUYHERB);
	Info_AddChoice		(DIA_Borka_BUYHERB,"Nadja.",DIA_Borka_BUYHERB_Nadja);
	Info_AddChoice		(DIA_Borka_BUYHERB,"Tak chceš uzavâít obchod, nebo ne?",DIA_Borka_BUYHERB_Deal);
};
FUNC VOID DIA_Borka_BUYHERB_NADJA ()
{
	AI_Output (other, self, "DIA_Borka_BUYHERB_NADJA_15_00"); //Nadja.
	AI_Output (self, other, "DIA_Borka_BUYHERB_NADJA_11_01"); //Co ty víš - ptáček si prostę zaštębetal. Nemůžeš vęâit všemu, co ti ta holka nakuká.
	
	Nadja_Victim = TRUE; 
	Undercover_Failed = TRUE;
	Info_ClearChoices 	(DIA_Borka_BUYHERB);
};
FUNC VOID DIA_Borka_BUYHERB_Deal ()
{
	AI_Output (other, self, "DIA_Borka_BUYHERB_Deal_15_00"); //Tak chceš uzavâít obchod, nebo ne?
	AI_PlayAni (self, "T_SEARCH");
	AI_Output (self, other, "DIA_Borka_BUYHERB_Deal_11_01"); //...no dobâe... tak tedy budeme obchodovat. Dej mi 50 zlaăáků a já ti za nę dám nęco ke kouâení. A žádné smlouvání.
	Info_ClearChoices 	(DIA_Borka_BUYHERB);
	Borka_Deal = TRUE;
};	
///////////////////////////////////////////////////////////////////////
//	Info SECOND_CHANCE
///////////////////////////////////////////////////////////////////////
instance DIA_Borka_SECOND_CHANCE		(C_INFO)
{
	npc			 = 	VLK_434_Borka;
	nr			 = 	2;
	condition	 = 	DIA_Borka_SECOND_CHANCE_Condition;
	information	 = 	DIA_Borka_SECOND_CHANCE_Info;
	permanent	 =  TRUE;  	
	description	 = 	"Tak uzavâeme obchod (zaplatit 50 zlaăáků).";
};
func int DIA_Borka_SECOND_CHANCE_Condition ()
{	
	var C_ITEM heroArmor; heroArmor = Npc_GetEquippedArmor(other);
	
	if 	(Borka_Deal == TRUE)
	&&  (Npc_HasItems (other, ItmI_Gold) >= 50)
	&&  (Hlp_IsItem (heroArmor, ItAR_MIl_L) == FALSE) 
	{
		return TRUE;
	};
};
func void DIA_Borka_SECOND_CHANCE_Info ()
{
	AI_Output (other, self, "DIA_Borka_SECOND_CHANCE_15_00"); //Tak dobâe, tady je to zlato.
	B_GiveInvItems (hero, self, ItMi_Gold, 50);
	AI_Output (self, other, "DIA_Borka_SECOND_CHANCE_11_01"); //Dobrá...
	AI_PlayAni (self, "T_SEARCH");
	AI_Output (self, other, "DIA_Borka_SECOND_CHANCE_11_02"); //...tady je čerstvý, pryskyâicí vylepšený joint.
	B_GiveInvItems (self, hero, ItMi_Joint, 1);
	Borka_Deal = 2;
	AI_StopProcessInfos (self);
};







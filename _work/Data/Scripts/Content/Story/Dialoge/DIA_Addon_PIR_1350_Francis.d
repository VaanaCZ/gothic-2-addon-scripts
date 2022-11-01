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
	description = "Tohle je tvá bouda?";
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
	AI_Output (other,self,"DIA_Addon_Francis_GregsHut_15_00"); //Tohle je tvoje chatrč?
	AI_Output (self,other,"DIA_Addon_Francis_GregsHut_13_01"); //Ne, patří Gregovi.
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
	description = "Musím se dostat do Gregovy chatrče.";
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
	AI_Output (other, self ,"DIA_Addon_Francis_LetMeIn_15_00"); //Musím se dostat do Gregovy boudy.
	AI_Output (self ,other ,"DIA_Addon_Francis_LetMeIn_13_01"); //Na to zapomeň!
	AI_Output (self ,other ,"DIA_Addon_Francis_LetMeIn_13_02"); //Greg tu není. A já zamknul dveře, aby nikoho nesvrběly ruce a nemoh se tam proplížit. 
	AI_Output (self ,other ,"DIA_Addon_Francis_LetMeIn_13_03"); //Vypadneš odsuď sám, nebo ti mám pomoct?
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
	description = "Greg je tvůj šéf?";
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
	AI_Output (other, self ,"DIA_Addon_Francis_AboutGreg_15_00"); //Greg je tvůj šéf?
	AI_Output (self ,other ,"DIA_Addon_Francis_AboutGreg_13_01"); //Ne, a nesnaž se mi namluvit, že ho znáš.
	AI_Output (self ,other ,"DIA_Addon_Francis_AboutGreg_13_02"); //Protože strašnýho kapitána Grega zná každej námořník i zatracená suchozemská krysa z tohohle ostrova.
	AI_Output (self ,other ,"DIA_Addon_Francis_AboutGreg_13_03"); //(nafoukaně) A von svěřil velení MNĚ!
	AI_Output (self ,other ,"DIA_Addon_Francis_AboutGreg_13_04"); //Zvodpovídám za to, aby ta líná pakáž dělala, co jí poručil.
	AI_Output (self ,other ,"DIA_Addon_Francis_AboutGreg_13_05"); //Některý chlapi si myslej, že když kapitán vystrčil paty, můžou si dělat, co chtěj.
	AI_Output (self ,other ,"DIA_Addon_Francis_AboutGreg_13_06"); //A budou POŘÁDNĚ překvapený, až se Greg vrátí. 
	AI_Output (self ,other ,"DIA_Addon_Francis_AboutGreg_13_07"); //Páč mu řeknu úplně vo všem, co se tu dělo, kapišto?
	AI_Output (self ,other ,"DIA_Addon_Francis_AboutGreg_13_08"); //Včetně toho, kdo se mu snažil vlézt do boudy.
	AI_Output (self ,other ,"DIA_Addon_Francis_AboutGreg_13_09"); //Takže odpal, jinak budeš mít pořádný problémy.
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
	description = "Dej mi klíč od Gregovy chatrče!";
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
	AI_Output (other, self,"DIA_Addon_Francis_Key_15_00"); //Dej mi klíč od Gregovy boudy!
	AI_Output (self ,other,"DIA_Addon_Francis_Key_13_01"); //To si snad děláš srandu!
	
	Info_ClearChoices (DIA_Addon_Francis_Key);
	Info_AddChoice (DIA_Addon_Francis_Key, "Popřemýšlím o tom.", DIA_Addon_Francis_Key_BACK);
	Info_AddChoice (DIA_Addon_Francis_Key, "Dám ti 2000 zlaťáků!", DIA_Addon_Francis_Key_2000Gold);
	Info_AddChoice (DIA_Addon_Francis_Key, "Dám ti 1000 zlaťáků!", DIA_Addon_Francis_Key_1000Gold);
};
func void DIA_Addon_Francis_Key_BACK()
{
	Info_ClearChoices (DIA_Addon_Francis_Key);
};
func void DIA_Addon_Francis_Key_1000Gold()
{
	AI_Output (other, self ,"DIA_Addon_Francis_Key_1000Gold_15_00"); //Dám ti za něj 1000 zlaťáků!
	AI_Output (self ,other ,"DIA_Addon_Francis_Key_1000Gold_13_01"); //Něco mi říká, že za takovej pakatel svýho kapitána nezradím.
	AI_Output (self ,other ,"DIA_Addon_Francis_Key_1000Gold_13_02"); //Bacha na zobák, jinak tě stáhnu z kůže!
};
func void DIA_Addon_Francis_Key_2000Gold()
{
	AI_Output (other,self ,"DIA_Addon_Francis_Key_2000Gold_15_00"); //Dám ti 2000 zlaťáků!
	
	if (Npc_HasItems (other,ItMI_Gold) >= 2000)
	{
		AI_Output (self ,other,"DIA_Addon_Francis_Key_2000Gold_13_01"); //Hochu, ty po mně chceš, abych se vzbouřil!
		AI_Output (self ,other,"DIA_Addon_Francis_Key_2000Gold_13_02"); //(pro sebe) No, ale na druhou stranu...
		AI_Output (self ,other,"DIA_Addon_Francis_Key_2000Gold_13_03"); //No dobře, dej to sem. Nikdo to nemusí vědět.
		AI_Output (self ,other,"DIA_Addon_Francis_Key_2000Gold_13_04"); //Tady máš klíč!
		AI_Output (self ,other,"DIA_Addon_Francis_Key_2000Gold_13_05"); //Ale koukej sebou hodit, než se Greg vrátí. A nikomu ani slovo, jasný?
		B_GiveInvItems (other, self,ItMi_Gold,2000);
		B_GiveInvItems (self ,other,ITKE_Greg_ADDON_MIS,1);
		Francis_bezahlt = TRUE;
	}
	else 
	{
		AI_Output (self ,other,"DIA_Addon_FrancisNotEnoughGold_13_05"); //(směje se) Ha! Vsadím se, že tolik ani nemáš!
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
	description = "Tak já se mrknu, co mi můžeš nabídnout.";
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
	AI_Output (other, self, "DIA_Addon_Francis_AufsMaul_15_00"); //No, tak se mrknem, copak tu máš.
	AI_Output (self, other, "DIA_Addon_Francis_AufsMaul_13_01"); //(pronikavě) Cože? Kapitán jsem tady já! 
	AI_Output (self, other, "DIA_Addon_Francis_AufsMaul_13_02"); //Já tě naučím úctě, ty suchozemská kryso!
	
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
	description = "Našel jsem tvou skrýš.";
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
	AI_Output (other,self ,"DIA_Addon_Francis_Key_Business_15_03"); //Našel jsem tvou skrýš, tvůj poklad i tvou účetní knihu. Je tvoje, že jo?
	AI_Output (self, other, "DIA_Addon_Francis_Buch_13_01"); //Ehm... tuhle knihu vidím poprvé v životě.
	AI_Output (self, other, "DIA_Addon_Francis_Buch_13_02"); //A... a i KDYBY byla moje...
	AI_Output (self, other, "DIA_Addon_Francis_Buch_13_03"); //Přeci VÁŽNĚ nevěříš, že by někdo uvěřil tý TVÝ historce, co se opírá jen o pár zažloutlejch stránek.
	AI_Output (other,self ,"DIA_Addon_Francis_Key_Business_15_01"); //Všechny jsi obíral o podíly.
	AI_Output (self, other, "DIA_Addon_Francis_Buch_13_04"); //Ehm... počkej chvilku...
	if (Npc_HasItems (self, ITKE_Greg_ADDON_MIS))
	{
		if (Npc_KnowsInfo (other, DIA_Addon_Francis_LetMeIn))
		{
			AI_Output (self, other, "DIA_Addon_Francis_Buch_13_05"); //(podlézavě) Chtěls klíč od Gregovy chajdy, viď?
		};
		AI_Output (self, other, "DIA_Addon_Francis_Buch_13_06"); //Tak já ti ten klíč od Gregovy chatrče DÁM!
		AI_Output (self, other, "DIA_Addon_Francis_Buch_13_07"); //Je tam spousta cennejch věcí...
		AI_Output (self, other, "DIA_Addon_Francis_Buch_13_08"); //(nervózně) Ale vrať mi tu knížku a drž hubu, jo?
		B_GiveInvItems (other,self,ITWR_Addon_FrancisAbrechnung_Mis,1);
		B_GiveInvItems (self ,other,ITKE_Greg_ADDON_MIS,1);
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Francis_Buch_13_09"); //Jen žádný pitomosti!
		if (Francis_bezahlt == TRUE)
		&& (Npc_HasItems(self, itmi_gold) >= 2000)
		{
			AI_Output (self, other, "DIA_Addon_Francis_Buch_13_10"); //Tady máš svejch 2000 zlatejch.
			AI_Output (self, other, "DIA_Addon_Francis_Buch_13_11"); //A přidám ti ještě dalších 500.
			B_GiveInvItems (self, other, itmi_gold, 2500);
		}
		else
		{
			AI_Output (self, other, "DIA_Addon_Francis_Buch_13_12"); //Tady máš 500 zlatejch!
			B_GiveInvItems (self, other, itmi_gold, 500);
		};
		AI_Output (self, other, "DIA_Addon_Francis_Buch_13_13"); //(rychle) A teď mi to dej.
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
	description = "(Tento klíč půjde ukrást snadno.)";
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
		AI_Output (self, other, "DIA_Addon_Francis_Ausgeschissen_13_00"); //(zuřivě) Kvůli tobě mě Greg nechá řezat dříví tak dlouho, dokud bude na tomdle ostrově stát jedinej strom!
	};
	AI_Output (self, other, "DIA_Addon_Francis_Ausgeschissen_13_01"); //Nech mě na pokoji!
	AI_StopProcessInfos (self);
};



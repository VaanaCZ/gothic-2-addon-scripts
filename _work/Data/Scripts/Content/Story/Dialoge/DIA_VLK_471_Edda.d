// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Edda_EXIT(C_INFO)
{
	npc			= VLK_471_Edda;
	nr			= 999;
	condition	= DIA_Edda_EXIT_Condition;
	information	= DIA_Edda_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Edda_EXIT_Condition()
{
		return TRUE;
};

FUNC VOID DIA_Edda_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};
// ************************************************************
// 			  				  Hallo 
// ************************************************************
INSTANCE DIA_Edda_Hallo(C_INFO)
{
	npc			= VLK_471_Edda;
	nr			= 2;
	condition	= DIA_Edda_Hallo_Condition;
	information	= DIA_Edda_Hallo_Info;
	permanent	= FALSE;
	Important   = TRUE;
};                       

FUNC INT DIA_Edda_Hallo_Condition()
{	
	if Npc_IsInState (self, ZS_Talk)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Edda_Hallo_Info()
{	
	AI_Output (other ,self,"DIA_Edda_Hallo_15_00"); //Che cosa stai cucinando?
	AI_Output (self ,other,"DIA_Edda_Hallo_17_01"); //Una zuppa di pesce. Non è molto saporita, ma almeno è calda.
	AI_Output (self ,other,"DIA_Edda_Hallo_17_02"); //Puoi assaggiarla se vuoi.
};

// ************************************************************
// 			Stadt
// ************************************************************
INSTANCE DIA_Edda_Stadt(C_INFO)
{
	npc			= VLK_471_Edda;
	nr			= 5;
	condition	= DIA_Edda_Stadt_Condition;
	information	= DIA_Edda_Stadt_Info;
	permanent	= FALSE;
	description = "Cosa mi dici della città?";
};                       

FUNC INT DIA_Edda_Stadt_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Edda_Stadt_Info()
{	
	AI_Output (other ,self,"DIA_Edda_Stadt_15_00"); //Cosa mi dici della città?
	AI_Output (self ,other,"DIA_Edda_Stadt_17_01"); //La maggior parte dei cittadini in città ha paura dei ladri. Di conseguenza non è una buona idea entrare in strane abitazioni.
	AI_Output (self ,other,"DIA_Edda_Stadt_17_02"); //Ma se stai cercando un posto per la notte, puoi sempre dormire nella mia capanna. C'è un letto supplementare che puoi usare.
	AI_Output (other ,self,"DIA_Edda_Stadt_15_03"); //Non hai paura dei ladri?
	AI_Output (self ,other,"DIA_Edda_Stadt_17_04"); //L'unica cosa di valore che possedevo mi è già stata tolta.
	AI_Output (self ,other,"DIA_Edda_Stadt_17_05"); //Qualcuno ha rubato la mia statua di Innos.
	
	Edda_Schlafplatz = TRUE;
	Wld_AssignRoomToGuild ("hafen08",	GIL_NONE);
};			
// ************************************************************
// 			Kannst du mir eine Suppe kochen?
// ************************************************************
INSTANCE DIA_Edda_Kochen(C_INFO)
{
	npc			= VLK_471_Edda;
	nr			= 6;
	condition	= DIA_Edda_Kochen_Condition;
	information	= DIA_Edda_Kochen_Info;
	permanent	= FALSE;
	description = "Mi prepari una zuppa?";
};                       

FUNC INT DIA_Edda_Kochen_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Edda_Kochen_Info()
{	
	AI_Output (other ,self,"DIA_Edda_Kochen_15_00"); //Mi prepari una zuppa?
	AI_Output (self ,other,"DIA_Edda_Kochen_17_01"); //Cucino per tutti e anche per te, se vuoi. Tutto quello che devi fare è portarmi un pesce.
};			
// ************************************************************
// 		tägliche Suppe abholen
// ************************************************************
INSTANCE DIA_Edda_Suppe(C_INFO)
{
	npc			= VLK_471_Edda;
	nr			= 6;
	condition	= DIA_Edda_Suppe_Condition;
	information	= DIA_Edda_Suppe_Info;
	permanent	= TRUE;
	description = "Mi prepari una zuppa?";
};                       

FUNC INT DIA_Edda_Suppe_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Edda_Kochen)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Edda_Suppe_Info()
{	
	AI_Output (other ,self,"DIA_Edda_Suppe_15_00"); //Mi prepari una zuppa?
	
	if (Wld_GetDay() == 0)
	{
		AI_Output (self ,other,"DIA_Edda_Suppe_17_02"); //A cominciare da domani, potrai venire e prendere della zuppa ogni giorno.
	}
	else if (Edda_Day != Wld_GetDay())
	{
		if B_GiveInvItems (other, self, ItFo_Fish,1)
		{
			AI_Output (self ,other,"DIA_Edda_Suppe_17_01"); //Niente di più facile. Ecco, prendi un piatto.
			B_GiveInvItems (self, other, ItFo_Fishsoup, 1);
			Edda_Day = Wld_GetDay ();
		}
		else
		{
			AI_Output (self ,other,"DIA_Edda_Suppe_17_04"); //Portami un pesce e ti cucinerò una zuppa gustosa.
		};
		
	}
	else
	{
		AI_Output (self ,other,"DIA_Edda_Suppe_17_03"); //No, non oggi. Torna domani.
	};
};			
// ************************************************************
// 			Ich habe hier eine Innos Statue 
// ************************************************************
INSTANCE DIA_Edda_Statue(C_INFO)
{
	npc			= VLK_471_Edda;
	nr			= 6;
	condition	= DIA_Edda_Statue_Condition;
	information	= DIA_Edda_Statue_Info;
	permanent	= FALSE;
	description = "Ascolta, ho una statua di Innos per te.";
};                       
FUNC INT DIA_Edda_Statue_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Edda_Stadt)
	&& (Npc_HasItems (other, ItMI_InnosStatue) >= 1) 
	{
		return TRUE;
	};
};
FUNC VOID DIA_Edda_Statue_Info()
{	
	AI_Output (other ,self,"DIA_Edda_Statue_15_00"); //Ascolta, ho una statua di Innos per te.
	AI_Output (self ,other,"DIA_Edda_Statue_17_01"); //Oh, grazie mille, grazie davvero! Che possa la luce di Innos risplendere su di te...
	AI_Output (other ,self,"DIA_Edda_Statue_15_02"); //Certo, non preoccuparti.
	
	B_GiveInvItems (other, self,ItMI_InnosStatue, 1); 
	B_GivePlayerXP (XP_Edda_Statue);
};				 
	
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Edda_PICKPOCKET (C_INFO)
{
	npc			= VLK_471_Edda;
	nr			= 900;
	condition	= DIA_Edda_PICKPOCKET_Condition;
	information	= DIA_Edda_PICKPOCKET_Info;
	permanent	= TRUE;
	description = "(Sarebbe un gioco da ragazzi sottrargli la statua)";
};                       

FUNC INT DIA_Edda_PICKPOCKET_Condition()
{
	if (Npc_GetTalentSkill (other,NPC_TALENT_PICKPOCKET) == 1) 
	&& (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (Npc_HasItems(self, ItMI_EddasStatue) >= 1)
	&& (other.attribute[ATR_DEXTERITY] >= (20 - Theftdiff))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Edda_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Edda_PICKPOCKET);
	Info_AddChoice		(DIA_Edda_PICKPOCKET, DIALOG_BACK 		,DIA_Edda_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Edda_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Edda_PICKPOCKET_DoIt);
};

func void DIA_Edda_PICKPOCKET_DoIt()
{
	if (other.attribute[ATR_DEXTERITY] >= 20)
	{
		B_GiveInvItems (self, other, ItMI_EddasStatue, 1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP();
		Info_ClearChoices (DIA_Edda_PICKPOCKET);
	}
	else
	{
		B_ResetThiefLevel();
		AI_StopProcessInfos	(self);
		B_Attack (self, other, AR_Theft, 1); 
	};
};
	
func void DIA_Edda_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Edda_PICKPOCKET);
};

	 





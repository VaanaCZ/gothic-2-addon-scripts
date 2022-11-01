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
	AI_Output (other ,self,"DIA_Edda_Hallo_15_00"); //Co tu gotujesz?
	AI_Output (self ,other,"DIA_Edda_Hallo_17_01"); //Zupę rybną. Może nie smakuje najlepiej, ale przynajmniej jest gorąca.
	AI_Output (self ,other,"DIA_Edda_Hallo_17_02"); //Jeśli chcesz, możesz spróbować.
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
	description = "Co możesz mi powiedzieć o mieście?";
};                       

FUNC INT DIA_Edda_Stadt_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Edda_Stadt_Info()
{	
	AI_Output (other ,self,"DIA_Edda_Stadt_15_00"); //Co możesz mi powiedzieć o mieście?
	AI_Output (self ,other,"DIA_Edda_Stadt_17_01"); //Większość jego mieszkańców obawia się złodziei. Dlatego lepiej nie wchodzić do obcych domów.
	AI_Output (self ,other,"DIA_Edda_Stadt_17_02"); //Jeśli jednak potrzebujesz noclegu, zapraszam do mojej chaty. Mam tu dodatkowe łóżko, możesz w nim spać, jeśli chcesz.
	AI_Output (other ,self,"DIA_Edda_Stadt_15_03"); //Nie boisz się złodziei?
	AI_Output (self ,other,"DIA_Edda_Stadt_17_04"); //Jedyna wartościowa rzecz, jaka kiedykolwiek należała do mnie, została mi odebrana.
	AI_Output (self ,other,"DIA_Edda_Stadt_17_05"); //Ktoś ukradł mój posążek Innosa.
	
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
	description = "Możesz mi ugotować zupę?";
};                       

FUNC INT DIA_Edda_Kochen_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Edda_Kochen_Info()
{	
	AI_Output (other ,self,"DIA_Edda_Kochen_15_00"); //Możesz mi ugotować zupę?
	AI_Output (self ,other,"DIA_Edda_Kochen_17_01"); //Gotuję dla wszystkich. Jeśli zechcesz, mogę gotować i dla ciebie. Musisz mi tylko przynieść rybę.
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
	description = "Możesz mi ugotować zupę?";
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
	AI_Output (other ,self,"DIA_Edda_Suppe_15_00"); //Możesz mi ugotować zupę?
	
	if (Wld_GetDay() == 0)
	{
		AI_Output (self ,other,"DIA_Edda_Suppe_17_02"); //Od jutra możesz codziennie liczyć na talerz mojej gorącej zupy.
	}
	else if (Edda_Day != Wld_GetDay())
	{
		if B_GiveInvItems (other, self, ItFo_Fish,1)
		{
			AI_Output (self ,other,"DIA_Edda_Suppe_17_01"); //Nic prostszego. Proszę, weź talerz.
			B_GiveInvItems (self, other, ItFo_Fishsoup, 1);
			Edda_Day = Wld_GetDay ();
		}
		else
		{
			AI_Output (self ,other,"DIA_Edda_Suppe_17_04"); //Przynieś mi rybę, a ugotuję ci smaczną zupę.
		};
		
	}
	else
	{
		AI_Output (self ,other,"DIA_Edda_Suppe_17_03"); //Nie, nie dzisiaj. Wróć jutro.
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
	description = "Patrz, przyniosłem ci posążek Innosa.";
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
	AI_Output (other ,self,"DIA_Edda_Statue_15_00"); //Patrz, przyniosłem ci posążek Innosa.
	AI_Output (self ,other,"DIA_Edda_Statue_17_01"); //Dziękuję, bardzo dziękuję. Niechaj światło Innosa zawsze oświetla ci drogę...
	AI_Output (other ,self,"DIA_Edda_Statue_15_02"); //Drobiazg.
	
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
	description = "(Kradzież tego posążka będzie dziecinnie łatwa)";
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

	 





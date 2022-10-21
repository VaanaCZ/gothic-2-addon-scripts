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
	description = "(It would be child's play to steal his key)";
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
	AI_Output (self, other, "DIA_Pablo_WANTED_12_00"); //Hey you, wait - you look familiar to me.
	AI_Output (other, self, "DIA_Pablo_WANTED_15_01"); //What do you want?
	AI_Output (self, other, "DIA_Pablo_WANTED_12_02"); //I've seen your face before somewhere ... ah - right!
	B_UseFakeScroll ();
	AI_Output (self, other, "DIA_Pablo_WANTED_12_03"); //Here - we found this picture on some bandits we picked up a few days ago - it looks a lot like you.
	B_GiveInvItems (self, other, ItWr_Poster_MIS,1);
	AI_Output (self, other, "DIA_Pablo_WANTED_12_04"); //Apparently, those guys were looking for you.
	
	
	Info_ClearChoices (DIA_Pablo_WANTED);
	
	Info_AddChoice  (DIA_Pablo_WANTED,"No, you've got to be mistaken.",DIA_Pablo_WANTED_NOTHING);
	Info_AddChoice 	(DIA_Pablo_WANTED,"Gee, I'd never have thought of that myself.",DIA_Pablo_WANTED_IRONY);
};
FUNC VOID DIA_Pablo_WANTED_NOTHING()
{
	AI_Output (other, self, "DIA_Pablo_WANTED_NOTHING_15_00"); //No, you've got to be mistaken. Everything's fine with me ...
	AI_Output (self, other, "DIA_Pablo_WANTED_NOTHING_12_01"); //Whatever you say, stranger.
	//AI_Output (self, other, "DIA_Pablo_WANTED_NOTHING_12_02"); //Aber wenn du Probleme hast - dann lass sie außerhalb der Stadt. Wir haben hier schon genug Schwierigkeiten.
	AI_Output (self ,other,"DIA_Pablo_Add_12_00"); //But if that happens to be YOUR mug after all - and if you have some problems - keep them outside of this town. Things are difficult enough here as it is.
	AI_Output (self, other, "DIA_Pablo_WANTED_NOTHING_12_03"); //And strangers who bring trouble into the city don't stay here long - I hope I make myself clear.
	Pablo_belogen = TRUE;
	
	AI_StopProcessInfos (self);
};
FUNC VOID DIA_Pablo_WANTED_IRONY()
{
	AI_Output (other, self, "DIA_Pablo_WANTED_IRONY_15_00"); //Gee, I'd never have thought of that myself.
	AI_Output (self, other, "DIA_Pablo_WANTED_IRONY_12_01"); //Very funny ... what did those fellows want from you?
	//AI_Output (other, self, "DIA_Pablo_WANTED_IRONY_15_02"); //Ich werde sie fragen, wenn ich sie sehe. Ihr habt doch die Kerle eingelocht, die den Wisch dabei hatten, oder?
	AI_Output (other, self,"DIA_Pablo_Add_15_01"); //Ask them yourself. You've got them safely locked up, haven't you?
	AI_Output (self, other, "DIA_Pablo_WANTED_IRONY_12_03"); //No - they're dead.
	AI_Output (other, self, "DIA_Pablo_WANTED_IRONY_15_04"); //I guess we'll never know, then.
	//AI_Output (self, other, "DIA_Pablo_WANTED_IRONY_12_05"); //Nun, wenn du in Schwierigkeiten steckst, dann sprich mal mit Lord Andre. Den Wisch kannst du behalten. Schönen Tag noch.
	AI_Output (self ,other,"DIA_Pablo_Add_12_02"); //If you're in some kind of trouble - go talk to Lord Andre. Maybe he can help you. You'll find him in the barracks.
	
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
	description = "What do you know about the bandits?";
};
FUNC INT DIA_Pablo_Banditen_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Pablo_Banditen_Info()
{
	AI_Output (other, self,"DIA_Pablo_Add_15_03"); //What do you know about the bandits?
	//AI_Output (other, self, "DIA_Pablo_Banditen_15_00"); //Was weißt du über die Banditen, die vor der Stadt ihr Unwesen treiben?
	AI_Output (self ,other,"DIA_Pablo_Add_12_04"); //They've all come from that blasted mining colony. But there are several splinter groups.
	AI_Output (self ,other,"DIA_Pablo_Add_12_05"); //Some have holed up in the mountains, and others have joined up with Onar, the landowner.
	AI_Output (self ,other,"DIA_Pablo_Add_12_06"); //But it's the bandits outside of town who cause the most problems.
	AI_Output (self ,other,"DIA_Pablo_Add_12_07"); //They're the reason that none of the merchants venture beyond the city gates now.
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
	description = "What do you know about the bandits who robbed Hakon the merchant?";
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
	AI_Output (other, self,"DIA_Pablo_Add_15_20"); //What do you know about the bandits who robbed Hakon the merchant?
	AI_Output (self ,other,"DIA_Pablo_Add_12_21"); //Oh, THAT matter. Don't remind me ...
	AI_Output (self ,other,"DIA_Pablo_Add_12_22"); //As far as we know, they're responsible for a lot of the attacks on merchants.
	
	AI_Output (self, other, "DIA_Pablo_Banditen_12_01"); //Those rats have crawled into their holes and don't dare come out again.
	AI_Output (self, other, "DIA_Pablo_Banditen_12_02"); //Once, we were able to track them down and follow them. But we broke off pursuit in the woods outside the city.
	AI_Output (self, other, "DIA_Pablo_Banditen_12_03"); //There's too many beasts roaming around there, it's much too dangerous.
	
	B_LogEntry(TOPIC_HakonBanditen,"The bandits who robbed Hakon are hiding in some woodlands near the town." );
	
	if (Pablo_AndreMelden == FALSE)
	{
		AI_Output (self ,other,"DIA_Pablo_Add_12_23"); //But there's one more thing ...
		AI_Output (self, other, "DIA_Pablo_Banditen_12_04"); //A few of the stolen goods have shown up in Khorinis.
		AI_Output (other, self, "DIA_Pablo_Banditen_15_05"); //This means that they know how they can smuggle the wares into town and sell them ...
		AI_Output (self, other, "DIA_Pablo_Banditen_12_06"); //Yeah, we suspect they have a fence in the city. But we haven't been able to catch the guy yet.
		AI_Output (self, other, "DIA_Pablo_Banditen_12_07"); //If you find out anything about the business, remember Lord Andre has posted a bounty for the fence.
	
		B_LogEntry(TOPIC_HakonBanditen,"The bandits are probably in cahoots with some dealer in the city. Lord Andre's got a reward out for the dealer." );
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
	description = "Where did the bandits who had my wanted poster come from?";
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
	AI_Output (other, self,"DIA_Pablo_Add_15_08"); //Where did the bandits who had my wanted poster come from?
	if (Pablo_belogen == TRUE)
	{
		AI_Output (self ,other,"DIA_Pablo_Add_12_09"); //A-HA! So it IS your mug after all. Why didn't you admit that right away, huh?
		AI_Output (self ,other,"DIA_Pablo_Add_12_10"); //(demanding) What are you wanted for?
		AI_Output (other, self,"DIA_Pablo_Add_15_11"); //I don't know - honest!
		AI_Output (self ,other,"DIA_Pablo_Add_12_12"); //Yeah, yeah. I know. Let me tell you something. If I thought you were in cahoots with these bandits, you'd already be cooling your heels in the slammer, understood?
		AI_Output (self ,other,"DIA_Pablo_Add_12_13"); //Still, I had better report this incident to Lord Andre ...
		Pablo_AndreMelden = TRUE;
		AI_Output (self ,other,"DIA_Pablo_Add_12_14"); //But - to answer your question ...
	};

	AI_Output (self ,other,"DIA_Pablo_Add_12_15"); //We picked them up near the landowner's place.
	AI_Output (self ,other,"DIA_Pablo_Add_12_16"); //But they don't look like Onar's people.
	AI_Output (self ,other,"DIA_Pablo_Add_12_17"); //I think they're part of a smaller group which has holed up in the mountains near Onar's farm.
	AI_Output (self ,other,"DIA_Pablo_Add_12_18"); //But if you intend to go there, let me warn you. Those cutthroats make short work of everyone!
	AI_Output (other, self,"DIA_Pablo_Add_15_19"); //I'll remember that.
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
	description = "How are things?";
};
FUNC INT DIA_Pablo_Perm_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Pablo_Perm_Info()
{
	AI_Output (other, self, "DIA_Pablo_Perm_15_00"); //How's the situation?
	
	if (Kapitel == 3)
	{
		if (MIS_RescueBennet != LOG_SUCCESS)
		{
			if (hero.guild == GIL_MIL)
			|| (hero.guild == GIL_PAL)
			{
				AI_Output (self, other, "DIA_Pablo_Perm_12_01"); //I've always said that these mercenaries can't be trusted.
				AI_Output (self, other, "DIA_Pablo_Perm_12_02"); //It's high time we taught that scum a lesson. Bennet didn't think this up all by himself.
			}
			else if (hero.guild == GIL_KDF)
			{
				AI_Output (self, other, "DIA_Pablo_Perm_12_03"); //I am deeply shaken by the murder of the honorable paladin Lothar.
				AI_Output (self, other, "DIA_Pablo_Perm_12_04"); //But I know that the church will find a just punishment for the villain.
			}
			else
			{
				AI_Output (self, other, "DIA_Pablo_Perm_12_05"); //What are you doing roaming around here? If you're trying to free your mercenary friend, you can just forget it.
			};
		}
		else //Bennet ist unschuldig
		{
			AI_Output (self, other, "DIA_Pablo_Perm_12_06"); //It's pathetic. Now they're stirring us up against each other.
			AI_Output (self, other, "DIA_Pablo_Perm_12_07"); //If you hadn't managed to find the real culprit for the murder, the orcs wouldn't have had to lift a finger.
		};
	}
	else if (Kapitel == 5)
	{
		AI_Output (self, other, "DIA_Pablo_Perm_12_08"); //I'm worried about what will happen if the paladins leave now.
	}
	else if (hero.guild == GIL_KDF)
	{
		AI_Output (self, other, "DIA_Pablo_Perm_12_09"); //You can count on us, we will use every available means to make sure that this city doesn't degenerate into a sink of iniquity.
	}
	else if (hero.guild == GIL_SLD)
	|| (hero.guild == GIL_DJG)
	{
		AI_Output (self, other, "DIA_Pablo_Perm_12_10"); //Just mind your step here. We watch rogues like you very closely around here.
	}
	else
	{
		AI_Output (self, other, "DIA_Pablo_Perm_12_11"); //At the moment it's quiet. Only the bandits outside the city are causing us problems.
	};	

}; 



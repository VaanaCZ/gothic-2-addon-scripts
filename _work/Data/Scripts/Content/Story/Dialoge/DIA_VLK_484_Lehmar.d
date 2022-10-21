///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Lehmar_EXIT   (C_INFO)
{
	npc         = VLK_484_Lehmar;
	nr          = 999;
	condition   = DIA_Lehmar_EXIT_Condition;
	information = DIA_Lehmar_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Lehmar_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Lehmar_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info Entschuldigung
///////////////////////////////////////////////////////////////////////
instance DIA_Lehmar_ENTSCHULDIGUNG		(C_INFO)
{
	npc			 = 	VLK_484_Lehmar;
	nr			 =  2;
	condition	 = 	DIA_Lehmar_ENTSCHULDIGUNG_Condition;
	information	 = 	DIA_Lehmar_ENTSCHULDIGUNG_Info;
	permanent 	 =  FALSE;
	description	 = 	"What's up?";
};

func int DIA_Lehmar_ENTSCHULDIGUNG_Condition ()
{
	return TRUE;
};

func void DIA_Lehmar_ENTSCHULDIGUNG_Info ()
{
	AI_Output (other, self, "DIA_Lehmar_ENTSCHULDIGUNG_15_00"); //How's it going?
	AI_Output (self, other, "DIA_Lehmar_ENTSCHULDIGUNG_09_01"); //(bored) How much do you want?
	AI_Output (other, self, "DIA_Lehmar_ENTSCHULDIGUNG_15_02"); //What do you mean, 'how much'?
	AI_Output (self, other, "DIA_Lehmar_ENTSCHULDIGUNG_09_03"); //I'm the moneylender and you came to me. What could you want from me? Money, of course.
};

///////////////////////////////////////////////////////////////////////
//	Info GeldLeihen
///////////////////////////////////////////////////////////////////////
instance DIA_Lehmar_GELDLEIHEN		(C_INFO)
{
	npc			 = 	VLK_484_Lehmar;
	nr			 =  3;
	condition	 = 	DIA_Lehmar_GELDLEIHEN_Condition;
	information	 = 	DIA_Lehmar_GELDLEIHEN_Info;
	permanent	 = 	TRUE;
	description	 = 	"Lend me some money!";
};
//----------------------------------------
var int DIA_Lehmar_GELDLEIHEN_noPerm;
//----------------------------------------
func int DIA_Lehmar_GELDLEIHEN_Condition ()
{
	if 	((Npc_KnowsInfo(other, DIA_Lehmar_ENTSCHULDIGUNG))
	&&  (DIA_Lehmar_GELDLEIHEN_noPerm == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lehmar_GELDLEIHEN_Info ()
{
	AI_Output (other, self, "DIA_Lehmar_GELDLEIHEN_15_00"); //Lend me some money!
	AI_Output (self, other, "DIA_Lehmar_GELDLEIHEN_09_01"); //Sure! How much would you like? I charge 20 percent!

	Info_ClearChoices	(DIA_Lehmar_GELDLEIHEN);

	Info_AddChoice	(DIA_Lehmar_GELDLEIHEN, "I'll think about it.", DIA_Lehmar_GELDLEIHEN_back );
	Info_AddChoice	(DIA_Lehmar_GELDLEIHEN, "1000 gold coins.", DIA_Lehmar_GELDLEIHEN_1000 );
	Info_AddChoice	(DIA_Lehmar_GELDLEIHEN, " 200 gold coins.", DIA_Lehmar_GELDLEIHEN_200 );
	Info_AddChoice	(DIA_Lehmar_GELDLEIHEN, "   50 gold coins.", DIA_Lehmar_GELDLEIHEN_50 );
	
	
};
func void DIA_Lehmar_GELDLEIHEN_back ()
{
	AI_Output (other, self, "DIA_Lehmar_GELDLEIHEN_back_15_00"); //I'll think about it.
	AI_Output (self, other, "DIA_Lehmar_GELDLEIHEN_back_09_01"); //Make up your mind! Don't waste my time!

	AI_StopProcessInfos (self);
};

func void DIA_Lehmar_GELDLEIHEN_50 ()
{
	AI_Output (other, self, "DIA_Lehmar_GELDLEIHEN_50_15_00"); //50 gold coins.
	AI_Output (self, other, "DIA_Lehmar_GELDLEIHEN_50_09_01"); //Small fry, huh? I want it back tomorrow, got it?

	CreateInvItems (self, ItMi_Gold, 50);
	B_GiveInvItems (self, other, ItMi_Gold, 50);

	DIA_Lehmar_GELDLEIHEN_noPerm = TRUE;
	Lehmar_GeldGeliehen_Day = Wld_GetDay(); 
	Lehmar_GeldGeliehen = 50;

	Info_ClearChoices	(DIA_Lehmar_GELDLEIHEN);

};

func void DIA_Lehmar_GELDLEIHEN_200 ()
{
	AI_Output (other, self, "DIA_Lehmar_GELDLEIHEN_200_15_00"); //200 gold coins.
	AI_Output (self, other, "DIA_Lehmar_GELDLEIHEN_200_09_01"); //That's a lot of money. I'll see you here again tomorrow, and the money too, understand?
	

	CreateInvItems (self, ItMi_Gold, 200);
	B_GiveInvItems (self, other, ItMi_Gold, 200);

	DIA_Lehmar_GELDLEIHEN_noPerm = TRUE;
	Lehmar_GeldGeliehen_Day = Wld_GetDay(); 
	Lehmar_GeldGeliehen = 200;

	Info_ClearChoices	(DIA_Lehmar_GELDLEIHEN);

};

func void DIA_Lehmar_GELDLEIHEN_1000 ()
{
	AI_Output (other, self, "DIA_Lehmar_GELDLEIHEN_1000_15_00"); //1000 gold coins.
	AI_Output (self, other, "DIA_Lehmar_GELDLEIHEN_1000_09_01"); //You got a couple of screws loose or something?
	AI_Output (self, other, "DIA_Lehmar_GELDLEIHEN_1000_09_02"); //I'll give you 100. And don't forget, I want it back tomorrow!
	

	CreateInvItems (self, ItMi_Gold, 100);
	B_GiveInvItems (self, other, ItMi_Gold, 100);


	DIA_Lehmar_GELDLEIHEN_noPerm = TRUE;
	Lehmar_GeldGeliehen_Day = Wld_GetDay(); 
	Lehmar_GeldGeliehen = 100;

	Info_ClearChoices	(DIA_Lehmar_GELDLEIHEN);
};

///////////////////////////////////////////////////////////////////////
//	Info warumGeld
///////////////////////////////////////////////////////////////////////
instance DIA_Lehmar_WARUMGELD		(C_INFO)
{
	npc			 = 	VLK_484_Lehmar;
	nr			 =  3;
	condition	 = 	DIA_Lehmar_WARUMGELD_Condition;
	information	 = 	DIA_Lehmar_WARUMGELD_Info;
	permanent	 =  FALSE;
	description	 = 	"Do you always throw your money at people like that?";
};

func int DIA_Lehmar_WARUMGELD_Condition ()
{
	if (Lehmar_GeldGeliehen != 0)
	{
		return TRUE;
	};
};

func void DIA_Lehmar_WARUMGELD_Info ()
{
	AI_Output (other, self, "DIA_Lehmar_WARUMGELD_15_00"); //Do you always throw your money at people like that?
	AI_Output (self, other, "DIA_Lehmar_WARUMGELD_09_01"); //(amused) Don't worry. You'll be back. Otherwise I'll find you and kill you. It's that simple.
	AI_Output (self, other, "DIA_Lehmar_WARUMGELD_09_02"); //You've got such a distinctive mug that it wouldn't take long for me to find you.
	AI_Output (self, other, "DIA_Lehmar_WARUMGELD_09_03"); //So don't even think about mucking around with me.
};
///////////////////////////////////////////////////////////////////////
//	Info geldeintreiben
///////////////////////////////////////////////////////////////////////
var int Lehmar_vorbei;

instance DIA_Lehmar_GELDEINTREIBEN		(C_INFO)
{
	npc			 = 	VLK_484_Lehmar;
	nr			 =  5;
	condition	 = 	DIA_Lehmar_GELDEINTREIBEN_Condition;
	information	 = 	DIA_Lehmar_GELDEINTREIBEN_Info;
	permanent	 =  FALSE;
	important	 = 	TRUE;
};

func int DIA_Lehmar_GELDEINTREIBEN_Condition ()
{
	if ((Lehmar_GeldGeliehen_Day<=(Wld_GetDay()-2))
	&& (Lehmar_GeldGeliehen != 0))
	&& (RangerHelp_LehmarKohle == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Lehmar_GELDEINTREIBEN_Info ()
{
	AI_Output (self, other, "DIA_Lehmar_GELDEINTREIBEN_09_00"); //You're overdue, you bastard! Give me my cash! And since I had to remind you about it, it gets more expensive.
	AI_Output (self, other, "DIA_Lehmar_GELDEINTREIBEN_09_01"); //That will cost you 30 percent instead of the usual 20.


	Info_ClearChoices	(DIA_Lehmar_GELDEINTREIBEN);
	Info_AddChoice	(DIA_Lehmar_GELDEINTREIBEN, "I'll pay my debts.", DIA_Lehmar_GELDEINTREIBEN_schuldenzahlen );
	Info_AddChoice	(DIA_Lehmar_GELDEINTREIBEN, "I'm not giving you anything.", DIA_Lehmar_GELDEINTREIBEN_kannstmich );
};
func void DIA_Lehmar_GELDEINTREIBEN_kannstmich ()
{
	AI_Output (other, self, "DIA_Lehmar_GELDEINTREIBEN_kannstmich_15_00"); //I'm not giving you anything.
	AI_Output (self, other, "DIA_Lehmar_GELDEINTREIBEN_kannstmich_09_01"); //Oh yes, you will.
	Lehmar_vorbei = TRUE;
	AI_StopProcessInfos (self);		
	
	B_Attack (self, other, AR_NONE, 1);
};

func void DIA_Lehmar_GELDEINTREIBEN_schuldenzahlen ()
{
	AI_Output (other, self, "DIA_Lehmar_GELDEINTREIBEN_schuldenzahlen_15_00"); //I'll pay my debts.

				 	///////////////////////////////////////////////////////////////////////	
		 	
				 				 	if (Lehmar_GeldGeliehen == 50)
										{
											Lehmar_GeldGeliehen_MitZinsen = 65;	
										};
									if (Lehmar_GeldGeliehen == 200)
										{
											Lehmar_GeldGeliehen_MitZinsen = 260;	
										};
									if (Lehmar_GeldGeliehen == 100)
										{
											Lehmar_GeldGeliehen_MitZinsen = 130;	
										};
					///////////////////////////////////////////////////////////////////////						
										IntToFloat	(Lehmar_GeldGeliehen_MitZinsen);


	if ((Npc_HasItems (other,ItMi_Gold)) >= Lehmar_GeldGeliehen_MitZinsen )
	{
		B_GiveInvItems (other, self, ItMi_Gold, Lehmar_GeldGeliehen_MitZinsen);
		
		AI_Output (self, other, "DIA_Lehmar_GELDEINTREIBEN_schuldenzahlen_09_01"); //Lucky you! And now scram!
		Lehmar_GeldGeliehen = 0;
		AI_StopProcessInfos (self);		
	}
	else
	{
		AI_Output (self, other, "DIA_Lehmar_GELDEINTREIBEN_schuldenzahlen_09_02"); //You don't have enough on you! Well, fine. I see I'll have to teach you a lesson.
		AI_Output (self, other, "DIA_Lehmar_GELDEINTREIBEN_schuldenzahlen_09_03"); //Don't take it personally - I have a reputation to maintain.
		Lehmar_vorbei = TRUE;
		
		AI_StopProcessInfos (self);		
		
		B_Attack (self, other, AR_NONE, 1);
	};
};
///////////////////////////////////////////////////////////////////////
//	Info Geldzurück
///////////////////////////////////////////////////////////////////////
instance DIA_Lehmar_GELDZURUECK		(C_INFO)
{
	npc			 = 	VLK_484_Lehmar;
	nr			 =  6;
	condition	 = 	DIA_Lehmar_GELDZURUECK_Condition;
	information	 = 	DIA_Lehmar_GELDZURUECK_Info;
	permanent	 =  TRUE;
	description	 = 	"Here's your money back!";
};
func int DIA_Lehmar_GELDZURUECK_Condition ()
{
	if 	(!(Npc_KnowsInfo(other, DIA_Lehmar_GELDEINTREIBEN))
	&&  (Lehmar_GeldGeliehen != 0))
	{
		return TRUE;
	};
};

func void DIA_Lehmar_GELDZURUECK_Info ()
{
	AI_Output (other, self, "DIA_Lehmar_GELDZURUECK_15_00"); //Here's your money back!

	if  (RangerHelp_LehmarKohle == TRUE)
	&& (Lehmar_GeldGeliehen_Day<=(Wld_GetDay()-2))
	{
		AI_Output (self, other, "DIA_Addon_Lehmar_GELDZURUECK_09_00"); //Don't worry. Lares has already taken care of this for you.
		AI_Output (self, other, "DIA_Addon_Lehmar_GELDZURUECK_09_01"); //That bastard is a friend of yours, huh? Oh well, none of my business. Have a nice day.
		Lehmar_GeldGeliehen = 0;
		AI_StopProcessInfos (self);		
	}
	else
	{
					 	///////////////////////////////////////////////////////////////////////	
					 								 	
					 				 	if (Lehmar_GeldGeliehen == 50)
											{
												Lehmar_GeldGeliehen_MitZinsen = 60;	
											};
										if (Lehmar_GeldGeliehen == 200)
											{
												Lehmar_GeldGeliehen_MitZinsen = 240;	
											};
										if (Lehmar_GeldGeliehen == 100)
											{
												Lehmar_GeldGeliehen_MitZinsen = 120;	
											};
						///////////////////////////////////////////////////////////////////////						
											IntToFloat	(Lehmar_GeldGeliehen_MitZinsen);
		
		if ( (Npc_HasItems (other,ItMi_Gold)) >= Lehmar_GeldGeliehen_MitZinsen )
		{
			B_GiveInvItems (other, self, ItMi_Gold, Lehmar_GeldGeliehen_MitZinsen);
				
			AI_Output (self, other, "DIA_Lehmar_GELDZURUECK_09_01"); //Wonderful! Nice doing business with you.
				
			Lehmar_GeldGeliehen = 0;
			AI_StopProcessInfos (self);		
		}
		else
		{
			AI_Output (self, other, "DIA_Lehmar_GELDZURUECK_09_02"); //You don't have enough! Come back when you have it. Your deadline is still open. Remember, 20 percent!
			AI_StopProcessInfos (self);		
		};
	};
};

///////////////////////////////////////////////////////////////////////
//	Info NOCHMALGELD
///////////////////////////////////////////////////////////////////////
instance DIA_Lehmar_NOCHMALGELD		(C_INFO)
{
	npc		 	 = 	VLK_484_Lehmar;
	nr			 =  8;
	condition	 = 	DIA_Lehmar_NOCHMALGELD_Condition;
	information	 = 	DIA_Lehmar_NOCHMALGELD_Info;
	permanent	 =	TRUE;	//Joly: letzte Info die im KAPITEL 1 Stehen bleibt
	description	 = 	"Can I borrow some more money from you?";
};
func int DIA_Lehmar_NOCHMALGELD_Condition ()
{
	if 	((Lehmar_GeldGeliehen == 0)
	&&  (Lehmar_GeldGeliehen_MitZinsen != 0)) //Joly: SC hat sich schon mal Geld geliehen!
	{
		return TRUE;
	};
};
func void DIA_Lehmar_NOCHMALGELD_Info ()
{
	AI_Output (other, self, "DIA_Lehmar_NOCHMALGELD_15_00"); //Can I borrow some more money from you?

	if (Npc_KnowsInfo(other, DIA_Lehmar_GELDEINTREIBEN))//Joly: SC hat Schulden nicht ordnungsgemäß zurück gezahlt!
	|| (Npc_KnowsInfo (other, DIA_Lehmar_BuchWeg))
	{
		AI_Output (self, other, "DIA_Lehmar_NOCHMALGELD_09_01"); //Do you think I'm stupid? Buzz off!
	}
	else
	{
		AI_Output (self, other, "DIA_Lehmar_NOCHMALGELD_09_02"); //No more now! I just had a big outlay and I need every coin.
		AI_Output (self, other, "DIA_Lehmar_NOCHMALGELD_09_03"); //Come back in a few days!
	};
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Lehmar_PICKPOCKET (C_INFO)
{
	npc			= VLK_484_Lehmar;
	nr			= 900;
	condition	= DIA_Lehmar_PICKPOCKET_Condition;
	information	= DIA_Lehmar_PICKPOCKET_Info;
	permanent	= TRUE;
	description = "(It would be child's play to steal his little book)";
};                       

FUNC INT DIA_Lehmar_PICKPOCKET_Condition()
{
	if (Npc_GetTalentSkill (other,NPC_TALENT_PICKPOCKET) == 1) 
	&& (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (Npc_HasItems(self, ItWr_Schuldenbuch) >= 1)
	&& (other.attribute[ATR_DEXTERITY] >= (20 - Theftdiff))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Lehmar_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Lehmar_PICKPOCKET);
	Info_AddChoice		(DIA_Lehmar_PICKPOCKET, DIALOG_BACK 		,DIA_Lehmar_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Lehmar_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Lehmar_PICKPOCKET_DoIt);
};

func void DIA_Lehmar_PICKPOCKET_DoIt()
{
	if (other.attribute[ATR_DEXTERITY] >= 20)
	{
		B_GiveInvItems (self, other, ItWr_Schuldenbuch, 1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP ();
		Info_ClearChoices (DIA_Lehmar_PICKPOCKET);
	}
	else
	{
		B_ResetThiefLevel();
		AI_StopProcessInfos	(self);
		B_Attack (self, other, AR_Theft, 1); //reagiert trotz IGNORE_Theft mit NEWS
	};
};
	
func void DIA_Lehmar_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Canthar_PICKPOCKET);
};

// ************************************************************
// 			  			Schuldenbuch weg
// ************************************************************

INSTANCE DIA_Lehmar_BuchWeg (C_INFO)
{
	npc			= VLK_484_Lehmar;
	nr			= 1;
	condition	= DIA_Lehmar_BuchWeg_Condition;
	information	= DIA_Lehmar_BuchWeg_Info;
	permanent	= FALSE;
	important 	= TRUE;
};                       

FUNC INT DIA_Lehmar_BuchWeg_Condition()
{
	if (self.aivar[AIV_DefeatedByPlayer] == FALSE)
	&& (self.aivar[AIV_PlayerHasPickedMyPocket] == TRUE)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Lehmar_BuchWeg_Info()
{	
	AI_Output (self, other, "DIA_Lehmar_Add_09_00"); //(remorsefully) Some miserable pickpocket has stolen my ledger ...
	AI_Output (self, other, "DIA_Lehmar_Add_09_01"); //You didn't have anything to do with this business, did you?
	AI_Output (other, self, "DIA_Addon_Lehmar_Add_15_02"); //(grins) Me? No.
	AI_Output (self, other, "DIA_Lehmar_Add_09_03"); //Yes, yes, all right. Just get out of here ...
	AI_StopProcessInfos (self);
};

// ************************************************************
// 			  			Lehmar verhauen
// ************************************************************
INSTANCE DIA_Lehmar_verhauen (C_INFO)
{
	npc			= VLK_484_Lehmar;
	nr			= 1;
	condition	= DIA_Lehmar_verhauen_Condition;
	information	= DIA_Lehmar_verhauen_Info;
	permanent	= TRUE;
	important 	= TRUE;
};                       
FUNC INT DIA_Lehmar_verhauen_Condition()
{
	if (Npc_IsInState (self, ZS_Talk))
	{
		if (self.aivar[AIV_DefeatedByPlayer] == TRUE)
		|| (Npc_KnowsInfo (other, DIA_Lehmar_BuchWeg))
		|| (Lehmar_vorbei == TRUE)
		{
			return TRUE;
		};
	};
};
 
FUNC VOID DIA_Lehmar_verhauen_Info()
{	
	B_Say (self, other, "$NOTNOW");
	AI_StopProcessInfos (self);
};






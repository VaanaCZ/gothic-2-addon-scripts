
//*********************************************************************
//	Info EXIT 
//*********************************************************************
INSTANCE DIA_Hokurn_EXIT   (C_INFO)
{
	npc         = DJG_712_Hokurn;
	nr          = 999;
	condition   = DIA_Hokurn_EXIT_Condition;
	information = DIA_Hokurn_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Hokurn_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Hokurn_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

//*********************************************************************
//	Info Hello 
//*********************************************************************
INSTANCE DIA_Hokurn_Hello   (C_INFO)
{
	npc         = DJG_712_Hokurn;
	nr          = 4;
	condition   = DIA_Hokurn_Hello_Condition;
	information = DIA_Hokurn_Hello_Info;
	permanent   = FALSE;
	important 	= TRUE;
};

FUNC INT DIA_Hokurn_Hello_Condition()
{
	if Npc_IsInState (self,ZS_Talk)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Hokurn_Hello_Info()
{
	AI_Output (self ,other,"DIA_Hokurn_Hello_01_00"); //Masz coœ do picia?
	AI_Output (other,self ,"DIA_Hokurn_Hello_15_01"); //Rozumiem, ¿e nie chodzi ci o wodê?
	AI_Output (self ,other,"DIA_Hokurn_Hello_01_02"); //Nie, do diaska! Potrzebujê jakiegoœ alkoholu, ¿eby pozbyæ siê tego cholernego bólu g³owy.
	AI_Output (self ,other,"DIA_Hokurn_Hello_01_03"); //Kiedy przez pewien czas nie mam siê czego napiæ, czujê, jakby ³epetyna mia³a mi zaraz wybuchn¹æ.

	Info_ClearChoices (DIA_Hokurn_Hello);
	Info_AddChoice (DIA_Hokurn_Hello,"Spróbujê coœ zorganizowaæ.",DIA_Hokurn_Hello_No);
	
	IF(	(Npc_HasItems (other,ItFo_Beer) 	>=1)	
	||	(Npc_HasItems (other,ItFo_Booze) 	>=1)	
	||	(Npc_HasItems (other,ItFo_Wine) 	>=1))
	{
		Info_AddChoice (DIA_Hokurn_Hello,"Proszê, weŸ to.",DIA_Hokurn_Hello_Yes);
	};
};

FUNC VOID DIA_Hokurn_Hello_No ()
{
	AI_Output (other,self ,"DIA_Hokurn_Hello_No_15_00"); //Nie mam nic, co móg³bym ci daæ.
	AI_Output (self ,other,"DIA_Hokurn_Hello_No_01_01"); //Wiêc spadaj!

	Info_ClearChoices (DIA_Hokurn_Hello);
	Info_AddChoice (DIA_Hokurn_Hello,DIALOG_ENDE,DIA_Hokurn_Hello_END);
	Info_AddChoice (DIA_Hokurn_Hello,"Jeszcze jedno...",DIA_Hokurn_Hello_ASK1);
};

FUNC VOID DIA_Hokurn_Hello_ASK1 ()
{
	AI_Output (other,self ,"DIA_Hokurn_Hello_ASK1_15_00"); //Jeszcze jedno...
	AI_Output (self ,other,"DIA_Hokurn_Hello_ASK1_01_01"); //Nie zrozumia³eœ mnie? WYNOCHA!!!
	
	Info_ClearChoices (DIA_Hokurn_Hello);
	Info_AddChoice (DIA_Hokurn_Hello,DIALOG_ENDE,DIA_Hokurn_Hello_END);
	Info_AddChoice (DIA_Hokurn_Hello,"To wa¿ne.",DIA_Hokurn_Hello_ASK2);
};

FUNC VOID DIA_Hokurn_Hello_ASK2 ()
{
	AI_Output (other,self ,"DIA_Hokurn_Hello_ASK2_15_00"); //To wa¿ne.
	AI_Output (self ,other,"DIA_Hokurn_Hello_ASK2_01_01"); //Sam siê o to prosi³eœ.
	
	AI_StopProcessInfos (self);
	B_Attack (self,other,AR_NONE, 1);
};

FUNC VOID DIA_Hokurn_Hello_END ()
{
	AI_StopProcessInfos (self);
};

FUNC VOID B_Hokurn_Sauf ()
{
	AI_Output (self ,other,"B_Hokurn_Sauf_01_00"); //Tego mi by³o trzeba.
	AI_Output (self ,other,"B_Hokurn_Sauf_01_01"); //No, znowu jasno myœlê. Co mogê dla ciebie zrobiæ?
};

FUNC VOID DIA_Hokurn_Hello_Yes ()
{
	AI_Output (other,self ,"DIA_Hokurn_Hello_Yes_15_00"); //Proszê, weŸ to.
	
	IF		(Npc_HasItems (other,ItFo_Booze) 	>=1)	
	{
		B_GiveInvItems (other,self,ItFo_Booze,1);	
		B_UseItem (self,ItFo_Booze);
	}
	else if	(Npc_HasItems (other,ItFo_Wine) 	>=1)	
	{
		B_GiveInvItems (other,self,ItFo_Wine,1);	
		B_UseItem (self,ItFo_Wine);
	}
	else if	(Npc_HasItems (other,ItFo_Beer) 	>=1)  
	{
		B_GiveInvItems (other,self,ItFo_Beer,1);	
		B_UseItem (self,ItFo_Beer);
	};
	HokurnLastDrink = Wld_GetDay ();
	HokurnGetsDrink = TRUE;
	
	B_Hokurn_Sauf ();
	
	Info_ClearChoices (DIA_Hokurn_Hello);
};

//*********************************************************************
//	Ich hab dir was zu Trinken mitgebracht.
//*********************************************************************
INSTANCE DIA_Hokurn_Drink   (C_INFO)
{
	npc         = DJG_712_Hokurn;
	nr          = 5;
	condition   = DIA_Hokurn_Drink_Condition;
	information = DIA_Hokurn_Drink_Info;
	permanent   = TRUE;
	description = "Przynios³em ci coœ do picia.";
};

FUNC INT DIA_Hokurn_Drink_Condition()
{
	if(	(HokurnGetsDrink == FALSE)
	&&(	(Npc_HasItems (other,ItFo_Beer) 	>=1)	
	||	(Npc_HasItems (other,ItFo_Booze) 	>=1)	
	||	(Npc_HasItems (other,ItFo_Wine) 	>=1)))
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Hokurn_Drink_Info()
{
	AI_Output (other,self ,"DIA_Hokurn_Drink_15_00"); //Przynios³em ci coœ do picia.
	AI_Output (self ,other,"DIA_Hokurn_Drink_01_01"); //Dawaj!
	
	IF	(Npc_HasItems (other,ItFo_Booze) 	>=1)	
	{
		B_GiveInvItems (other,self,ItFo_Booze,1);	
		B_UseItem (self,ItFo_Booze);
	}
	else if	(Npc_HasItems (other,ItFo_Wine) 	>=1)	
	{
		B_GiveInvItems (other,self,ItFo_Wine,1);	
		B_UseItem (self,ItFo_Wine);
	}
	else if	(Npc_HasItems (other,ItFo_Beer) 	>=1)  
	{
		B_GiveInvItems (other,self,ItFo_Beer,1);	
		B_UseItem (self,ItFo_Beer);
	};
	HokurnLastDrink = Wld_GetDay ();
	HokurnGetsDrink = TRUE;
	
	B_Hokurn_Sauf ();
};

//*********************************************************************
//	Ich hab da ein paar Fragen.
//*********************************************************************
INSTANCE DIA_Hokurn_Question   (C_INFO)
{
	npc         = DJG_712_Hokurn;
	nr          = 5;
	condition   = DIA_Hokurn_Question_Condition;
	information = DIA_Hokurn_Question_Info;
	permanent   = TRUE;
	description = "Potrzebujê paru informacji.";
};

FUNC INT DIA_Hokurn_Question_Condition()
{
	if	(HokurnGetsDrink == FALSE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Hokurn_Question_Info()
{
	AI_Output (other,self ,"DIA_Hokurn_Question_15_00"); //Potrzebujê paru informacji.
	AI_Output (self ,other,"DIA_Hokurn_Question_01_01"); //Myœla³em, ¿e siê zrozumieliœmy. Gadam tylko z przyjació³mi.
	AI_Output (self ,other,"DIA_Hokurn_Question_01_02"); //A przyjaciele proponuj¹ jakiœ napitek. £apiesz? A teraz spadaj!
};

//*********************************************************************
//	Ich such jemanden, der mir was beibringen kann.
//*********************************************************************
INSTANCE DIA_Hokurn_Learn   (C_INFO)
{
	npc         = DJG_712_Hokurn;
	nr          = 6;
	condition   = DIA_Hokurn_Learn_Condition;
	information = DIA_Hokurn_Learn_Info;
	permanent   = FALSE;
	description = "Szukam kogoœ, kto móg³by mnie czegoœ nauczyæ.";
};

FUNC INT DIA_Hokurn_Learn_Condition()
{
	if	(HokurnGetsDrink == TRUE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Hokurn_Learn_Info()
{
	AI_Output (other,self ,"DIA_Hokurn_Learn_15_00"); //Szukam kogoœ, kto móg³by mnie czegoœ nauczyæ.
	AI_Output (self ,other,"DIA_Hokurn_Learn_01_01"); //Móg³bym ci pokazaæ to i owo. Jestem najlepszym wojownikiem w okolicy.
	AI_Output (self ,other,"DIA_Hokurn_Learn_01_02"); //Poniewa¿ jesteœmy przyjació³mi, dam ci specjaln¹ cenê. 300 sztuk z³ota.

	Info_ClearChoices (DIA_Hokurn_Learn);
	Info_AddChoice	(DIA_Hokurn_Learn,"To trochê za drogo.",DIA_Hokurn_Learn_TooExpensive);
	if (Npc_HasItems (other,ItMi_Gold) >= 300)
	{
		Info_AddChoice	(DIA_Hokurn_Learn,"W porz¹dku. Oto pieni¹dze.",DIA_Hokurn_Learn_OK);
	};	 
};

FUNC VOID DIA_Hokurn_Learn_TooExpensive ()
{
	AI_Output (other,self ,"DIA_Hokurn_Learn_TooExpensive_15_00"); //To dla mnie za drogo.
	AI_Output (self ,other,"DIA_Hokurn_Learn_TooExpensive_01_01"); //Za drogo? Ka¿dy inny na moim miejscu policzy³by sobie wiêcej.
	AI_Output (self ,other,"DIA_Hokurn_Learn_TooExpensive_01_02"); //Przemyœl to.
	
	Info_ClearChoices (DIA_Hokurn_Learn);
};

FUNC VOID DIA_Hokurn_Learn_OK ()
{
	AI_Output (other,self ,"DIA_Hokurn_Learn_OK_15_00"); //W porz¹dku. Oto pieni¹dze.
	B_GiveInvItems (other,self,ItMi_Gold,300);
	Hokurn_TeachPlayer = TRUE;
	Info_ClearChoices (DIA_Hokurn_Learn);
};

//*********************************************************************
//	Hier ist dein Geld. Ich will trainieren.
//*********************************************************************
INSTANCE DIA_Hokurn_PayTeacher   (C_INFO)
{
	npc         = DJG_712_Hokurn;
	nr          = 6;
	condition   = DIA_Hokurn_PayTeacher_Condition;
	information = DIA_Hokurn_PayTeacher_Info;
	permanent   = TRUE;
	description = "Masz tu pieni¹dze. Chcê, ¿ebyœ mnie wyszkoli³.";
};

FUNC INT DIA_Hokurn_PayTeacher_Condition()
{
	if	(Npc_KnowsInfo (other,DIA_Hokurn_Learn))
	&&	(Npc_HasItems (other,ItMi_Gold) >= 300)
	&& 	(HoKurn_TeachPlayer == FALSE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Hokurn_PayTeacher_Info()
{
	AI_Output (other,self ,"DIA_Hokurn_PayTeacher_15_00"); //Masz tu pieni¹dze. Chcê, ¿ebyœ mnie wyszkoli³.
	AI_Output (self ,other,"DIA_Hokurn_PayTeacher_01_01"); //Nie po¿a³ujesz tego!

	B_GiveInvItems (other,self,ItMi_Gold,300);
	Hokurn_TeachPlayer = TRUE;
};

//*********************************************************************
//	Hier ist dein Drink.
//*********************************************************************
INSTANCE DIA_Hokurn_DrinkAndLearn   (C_INFO)
{
	npc         = DJG_712_Hokurn;
	nr          = 7;
	condition   = DIA_Hokurn_DrinkAndLearn_Condition;
	information = DIA_Hokurn_DrinkAndLearn_Info;
	permanent   = TRUE;
	description = "Masz tu coœ do picia.";
};

FUNC INT DIA_Hokurn_DrinkAndLearn_Condition()
{
	if	(HokurnGetsDrink == TRUE)
	&&(	(Npc_HasItems (other,ItFo_Booze) >= 1)
	||	(Npc_HasItems (other,ItFo_Wine) >= 1)
	||	(Npc_HasItems (other,ItFo_Beer) >= 1))
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Hokurn_DrinkAndLearn_Info()
{
	AI_Output (other,self ,"DIA_Hokurn_DrinkAndLearn_15_00"); //Masz tu coœ do picia.
	
	IF	(Npc_HasItems (other,ItFo_Booze) 	>=1)	
	{
		B_GiveInvItems (other,self,ItFo_Booze,1);	
		B_UseItem (self,ItFo_Booze);
	}
	else if	(Npc_HasItems (other,ItFo_Wine) 	>=1)	
	{
		B_GiveInvItems (other,self,ItFo_Wine,1);	
		B_UseItem (self,ItFo_Wine);
	}
	else if	(Npc_HasItems (other,ItFo_Beer) 	>=1) 
	{
		B_GiveInvItems (other,self,ItFo_Beer,1);	
		B_UseItem (self,ItFo_Beer);
	};
	
	HokurnLastDrink = Wld_GetDay ();
	
	AI_Output (self ,other,"DIA_Hokurn_DrinkAndLearn_01_01"); //Czujê siê znacznie lepiej. Teraz mogê przenosiæ góry!

};

//*********************************************************************
//	Lass uns trainieren!
//*********************************************************************

INSTANCE DIA_Hokurn_Teach(C_INFO)
{
	npc			= DJG_712_Hokurn;
	nr			= 7;
	condition	= DIA_Hokurn_Teach_Condition;
	information	= DIA_Hokurn_Teach_Info;
	permanent	= TRUE;
	description = "Dobra. Bierzmy siê do nauki.";
};                       

FUNC INT DIA_Hokurn_Teach_Condition()
{
	IF (Hokurn_Teachplayer == TRUE)
	{
		return TRUE;
	};	
};
 
FUNC VOID DIA_Hokurn_Teach_Info()
{	
	AI_Output (other,self ,"DIA_Hokurn_Teach_15_00"); //Zacznijmy od nauki.
	
	if (HokurnLastDrink < Wld_GetDay ())
	{
		AI_Output (self ,other,"DIA_Hokurn_Teach_01_01"); //Najpierw przynieœ mi coœ do picia!
	}
	else
	{	 
		if (hero.guild == GIL_PAL)
		{
			AI_Output (self ,other,"DIA_Hokurn_Teach_01_02"); //Wtedy przekonamy siê, co mo¿emy wycisn¹æ z tych spróchnia³ych paladyñskich koœci.
		}
		else if (hero.guild == GIL_KDF)
		{
			AI_Output (self ,other,"DIA_Hokurn_Teach_01_03"); //No widzisz. Nawet magicy u¿ywaj¹ broni do walki wrêcz.
		};

		Info_ClearChoices 	(DIA_Hokurn_Teach);
		Info_AddChoice 		(DIA_Hokurn_Teach,	DIALOG_BACK		,DIA_Hokurn_Teach_Back);
		Info_AddChoice		(DIA_Hokurn_Teach, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1))			,DIA_Hokurn_Teach_2H_1);
		Info_AddChoice		(DIA_Hokurn_Teach, B_BuildLearnString(PRINT_Learn2h5	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5))			,DIA_Hokurn_Teach_2H_5);
		Info_AddChoice		(DIA_Hokurn_Teach, B_BuildLearnString(PRINT_Learn1h1	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1))			,DIA_Hokurn_Teach_1H_1);
		Info_AddChoice		(DIA_Hokurn_Teach, B_BuildLearnString(PRINT_Learn1h5	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 5))			,DIA_Hokurn_Teach_1H_5);
	};
};

FUNC VOID DIA_Hokurn_Teach_Back ()
{
	Info_ClearChoices (DIA_Hokurn_Teach);
};
FUNC VOID B_Hokurn_TeachedEnough ()
{
	AI_Output(self,other,"B_Hokurn_TeachedEnough_01_00"); //Nie potrzebujesz ju¿ nauczyciela w tej dyscyplinie.
};

FUNC VOID DIA_Hokurn_Teach_2H_1 ()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_2H, 1, 100);
	
	if (other.HitChance[NPC_TALENT_2H] >= 100)
	{
		B_Hokurn_TeachedEnough ();
	};
	Info_AddChoice		(DIA_Hokurn_Teach, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1))			,DIA_Hokurn_Teach_2H_1);	
};

FUNC VOID DIA_Hokurn_Teach_2H_5 ()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_2H, 5, 100);
	
	if (other.HitChance[NPC_TALENT_2H] >= 100)
	{
		B_Hokurn_TeachedEnough ();
	};
	Info_AddChoice		(DIA_Hokurn_Teach, B_BuildLearnString(PRINT_Learn2h5, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5))	,DIA_Hokurn_Teach_2H_5);	
};

FUNC VOID DIA_Hokurn_Teach_1H_1 ()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_1H, 1, 100);
	
	if (other.HitChance[NPC_TALENT_1H] >= 100)
	{
		B_Hokurn_TeachedEnough ();
	};
	Info_AddChoice		(DIA_Hokurn_Teach, B_BuildLearnString(PRINT_Learn1h1	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1))			,DIA_Hokurn_Teach_1H_1);	
};

FUNC VOID DIA_Hokurn_Teach_1H_5 ()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_1H, 5, 100);
	
	if (other.HitChance[NPC_TALENT_1H] >= 100)
	{
		B_Hokurn_TeachedEnough ();
	};
	Info_AddChoice		(DIA_Hokurn_Teach, B_BuildLearnString(PRINT_Learn1h5	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 5)) ,DIA_Hokurn_Teach_1H_5);	
};

//*********************************************************************
//	Wieso hängt ihr hier überhaupt rum?
//*********************************************************************
INSTANCE DIA_Hokurn_StayHere   (C_INFO)
{
	npc         = DJG_712_Hokurn;
	nr          = 5;
	condition   = DIA_Hokurn_StayHere_Condition;
	information = DIA_Hokurn_StayHere_Info;
	permanent   = FALSE;
	description = "A co tu w³aœciwie robisz?";
};

FUNC INT DIA_Hokurn_StayHere_Condition()
{
	if	(HokurnGetsDrink == TRUE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Hokurn_StayHere_Info()
{
	AI_Output (other,self ,"DIA_Hokurn_StayHere_15_00"); //A tak w ogóle - co tutaj robisz?
	AI_Output (self ,other,"DIA_Hokurn_StayHere_01_01"); //Nie mam pojêcia, co tutaj robimy, ani kiedy siê to zacznie.
	AI_Output (self ,other,"DIA_Hokurn_StayHere_01_02"); //I nie obchodzi mnie to, dopóki mam coœ do picia.
	
	/*
	AI_Output (other,self ,"DIA_Addon_Hokurn_StayHere_15_00"); //Was wollt ihr hier überhaupt?
	AI_Output (self ,other,"DIA_Addon_Hokurn_StayHere_01_01"); //Keine Ahnung, was wir hier machen oder wann es los geht.
	AI_Output (self ,other,"DIA_Addon_Hokurn_StayHere_01_02"); //Ist mir auch egal, solange ich genug zu trinken habe.
	*/
	
};

//*********************************************************************
//	Wisst ihr denn, wo die Drachen sind.
//*********************************************************************
INSTANCE DIA_Hokurn_WhereDragon   (C_INFO)
{
	npc         = DJG_712_Hokurn;
	nr          = 5;
	condition   = DIA_Hokurn_WhereDragon_Condition;
	information = DIA_Hokurn_WhereDragon_Info;
	permanent   = TRUE;
	description = "A czy wiesz, gdzie s¹ smoki?";
};

FUNC INT DIA_Hokurn_WhereDragon_Condition()
{
	if	(HokurnGetsDrink == TRUE)
	&& 	(HokurnTellsDragon == FALSE)
	&&	(Npc_KnowsInfo (other,DIA_Hokurn_StayHere))
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Hokurn_WhereDragon_Info()
{
	AI_Output (other,self ,"DIA_Hokurn_WhereDragon_15_00"); //A czy wiesz, gdzie s¹ smoki?
	AI_Output (self ,other,"DIA_Hokurn_WhereDragon_01_01"); //A co bêdê z tego mia³, jeœli ci powiem?

	Info_ClearChoices (DIA_Hokurn_WhereDragon);
	Info_AddChoice (DIA_Hokurn_WhereDragon,"Nic, sam ich szukam.",DIA_Hokurn_WhereDragon_FindMyself);
	Info_AddChoice (DIA_Hokurn_WhereDragon,"Jestem gotów zap³aciæ za tak¹ informacjê.",DIA_Hokurn_WhereDragon_Gold);
	if Npc_HasItems (other,ITFO_BOOZE) >=1
	{
		Info_AddChoice (DIA_Hokurn_WhereDragon,"Wci¹¿ mam butelkê d¿inu!",DIA_Hokurn_WhereDragon_Booze);	 
	};
};

FUNC VOID DIA_Hokurn_WhereDragon_FindMyself ()
{
	AI_Output (other,self ,"DIA_Hokurn_WhereDragon_FindMyself_15_00"); //Nic, sam ich szukam.
	AI_Output (self ,other,"DIA_Hokurn_WhereDragon_FindMyself_01_01"); //Lepiej uwa¿aj. Czeka ciê cholernie ciê¿ka walka.
	Info_ClearChoices (DIA_Hokurn_WhereDragon);
};

FUNC VOID DIA_Hokurn_WhereDragon_Gold ()
{
	AI_Output (other,self ,"DIA_Hokurn_WhereDragon_Gold_15_00"); //Jestem gotów zap³aciæ za tak¹ informacjê.
	AI_Output (self ,other,"DIA_Hokurn_WhereDragon_Gold_01_01"); //Zap³aciæ? Hmmm. Powiem ci, co wiem, za 200 sztuk z³ota.
	
	Info_ClearChoices (DIA_Hokurn_WhereDragon);
	Info_AddChoice (DIA_Hokurn_WhereDragon,"Za du¿o!",DIA_Hokurn_WhereDragon_TooMuch);
	if Npc_HasItems (other,ItMi_Gold) >=200
	{
		Info_AddChoice (DIA_Hokurn_WhereDragon,"Stoi. Oto pieni¹dze!",DIA_Hokurn_WhereDragon_OK);
	};
};

FUNC VOID DIA_Hokurn_WhereDragon_TooMuch ()
{
	AI_Output	(other,self ,"DIA_Hokurn_WhereDragon_TooMuch_15_00"); //Za du¿o!
	AI_Output 	(self ,other,"DIA_Hokurn_WhereDragon_TooMuch_01_01"); //No to zapomnij o tym.
	Info_ClearChoices	(DIA_Hokurn_WhereDragon); 
};

FUNC VOID DIA_Hokurn_WhereDragon_OK ()
{
	AI_Output (other,self ,"DIA_Hokurn_WhereDragon_OK_15_00"); //Stoi. Oto pieni¹dze!
	B_GiveInvItems (other,self,ItMi_gold,200);
	
	HokurnTellsDragon = TRUE;
	Info_ClearChoices (DIA_Hokurn_WhereDragon);
};

FUNC VOID DIA_Hokurn_WhereDragon_Booze ()
{
	AI_Output (other,self ,"DIA_Hokurn_WhereDragon_Booze_15_00"); //Wci¹¿ mam butelkê d¿inu!
	AI_Output (self ,other,"DIA_Hokurn_WhereDragon_Booze_01_01"); //Za dobry trunek gotów jestem walczyæ ze wszystkimi smokami œwiata.
	AI_Output (self ,other,"DIA_Hokurn_WhereDragon_Booze_01_02"); //Zgoda. Dawaj tê butelkê!
	B_GiveInvItems ( other,self,ItFo_booze,1);
	AI_Output (self ,other,"DIA_Hokurn_WhereDragon_Booze_01_03"); //Zachowam j¹ na deszczowy dzieñ.

	HokurnTellsDragon = TRUE;
	Info_ClearChoices (DIA_Hokurn_WhereDragon);
};

//*********************************************************************
//	Also, wo sind jetzt die Drachen?
//*********************************************************************
INSTANCE DIA_Hokurn_Dragon   (C_INFO)
{
	npc         = DJG_712_Hokurn;
	nr          = 5;
	condition   = DIA_Hokurn_Dragon_Condition;
	information = DIA_Hokurn_Dragon_Info;
	permanent   = TRUE;
	description = "No dobra, przejdŸmy do rzeczy - gdzie s¹ te smoki?";
};

FUNC INT DIA_Hokurn_Dragon_Condition()
{
	if	(HokurnTellsDragon == TRUE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Hokurn_Dragon_Info()
{
	AI_Output (other,self ,"DIA_Hokurn_Dragon_15_00"); //No dobra, przejdŸmy do rzeczy - gdzie s¹ te smoki?
	AI_Output (self ,other,"DIA_Hokurn_Dragon_01_01"); //Oczywiœcie nie znam ¿adnych szczegó³ów, ale s³ysza³em, ¿e s¹ cztery smoki.
	AI_Output (self ,other,"DIA_Hokurn_Dragon_01_02"); //W nocy, nad najwy¿sz¹ gór¹, widzieliœmy czerwon¹ ³unê.
	AI_Output (self ,other,"DIA_Hokurn_Dragon_01_03"); //Przysiêgam na moj¹ matkê. Jak szukasz smoka, to na pewno tam jakiegoœ znajdziesz.
};

//*********************************************************************
//	AllDragonsDead 
//*********************************************************************
INSTANCE DIA_Hokurn_AllDragonsDead   (C_INFO)
{
	npc         = DJG_712_Hokurn;
	nr          = 5;
	condition   = DIA_Hokurn_AllDragonsDead_Condition;
	information = DIA_Hokurn_AllDragonsDead_Info;
	permanent   = TRUE;
	description	= "Zabi³em wszystkie smoki.";
				
};

FUNC INT DIA_Hokurn_AllDragonsDead_Condition()
{
	if (MIS_AllDragonsDead == TRUE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Hokurn_AllDragonsDead_Info()
{
	AI_Output	(other,self ,"DIA_Hokurn_AllDragonsDead_15_00"); //Zabi³em wszystkie smoki.
	AI_Output 	(self ,other,"DIA_Hokurn_AllDragonsDead_01_01"); //Nie gadaj po pró¿nicy, ja siê na takie bajki na pewno nie nabiorê!
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Hokurn_PICKPOCKET (C_INFO)
{
	npc			= DJG_712_Hokurn;
	nr			= 900;
	condition	= DIA_Hokurn_PICKPOCKET_Condition;
	information	= DIA_Hokurn_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80;
};                       

FUNC INT DIA_Hokurn_PICKPOCKET_Condition()
{
	C_Beklauen (69, 210);
};
 
FUNC VOID DIA_Hokurn_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Hokurn_PICKPOCKET);
	Info_AddChoice		(DIA_Hokurn_PICKPOCKET, DIALOG_BACK 		,DIA_Hokurn_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Hokurn_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Hokurn_PICKPOCKET_DoIt);
};

func void DIA_Hokurn_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Hokurn_PICKPOCKET);
};
	
func void DIA_Hokurn_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Hokurn_PICKPOCKET);
};




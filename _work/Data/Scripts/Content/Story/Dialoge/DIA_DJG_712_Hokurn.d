
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
	AI_Output (self ,other,"DIA_Hokurn_Hello_01_00"); //У тебя не найдется чего-нибудь выпить?
	AI_Output (other,self ,"DIA_Hokurn_Hello_15_01"); //Полагаю, вода тебе не подойдет.
	AI_Output (self ,other,"DIA_Hokurn_Hello_01_02"); //Нет, черт побери!!! Мне нужно что-нибудь алкогольное, чтобы я, наконец, мог избавиться от этой проклятой головной боли.
	AI_Output (self ,other,"DIA_Hokurn_Hello_01_03"); //Когда мне долго не удается промочить горло, мой череп раскалывается и мне кажется, что он вот-вот взорвется.

	Info_ClearChoices (DIA_Hokurn_Hello);
	Info_AddChoice (DIA_Hokurn_Hello,"Я ничем не могу помочь тебе.",DIA_Hokurn_Hello_No);
	
	IF(	(Npc_HasItems (other,ItFo_Beer) 	>=1)	
	||	(Npc_HasItems (other,ItFo_Booze) 	>=1)	
	||	(Npc_HasItems (other,ItFo_Wine) 	>=1))
	{
		Info_AddChoice (DIA_Hokurn_Hello,"Вот, возьми это.",DIA_Hokurn_Hello_Yes);
	};
};

FUNC VOID DIA_Hokurn_Hello_No ()
{
	AI_Output (other,self ,"DIA_Hokurn_Hello_No_15_00"); //Я ничем не могу помочь тебе.
	AI_Output (self ,other,"DIA_Hokurn_Hello_No_01_01"); //Тогда проваливай!

	Info_ClearChoices (DIA_Hokurn_Hello);
	Info_AddChoice (DIA_Hokurn_Hello,DIALOG_ENDE,DIA_Hokurn_Hello_END);
	Info_AddChoice (DIA_Hokurn_Hello,"Еще одно...",DIA_Hokurn_Hello_ASK1);
};

FUNC VOID DIA_Hokurn_Hello_ASK1 ()
{
	AI_Output (other,self ,"DIA_Hokurn_Hello_ASK1_15_00"); //Еще одно...
	AI_Output (self ,other,"DIA_Hokurn_Hello_ASK1_01_01"); //(ревет) Ты что, не понял меня? УБИРАЙСЯ!!!
	
	Info_ClearChoices (DIA_Hokurn_Hello);
	Info_AddChoice (DIA_Hokurn_Hello,DIALOG_ENDE,DIA_Hokurn_Hello_END);
	Info_AddChoice (DIA_Hokurn_Hello,"Это важно.",DIA_Hokurn_Hello_ASK2);
};

FUNC VOID DIA_Hokurn_Hello_ASK2 ()
{
	AI_Output (other,self ,"DIA_Hokurn_Hello_ASK2_15_00"); //Это важно.
	AI_Output (self ,other,"DIA_Hokurn_Hello_ASK2_01_01"); //(ревет) Ты сам напросился.
	
	AI_StopProcessInfos (self);
	B_Attack (self,other,AR_NONE, 1);
};

FUNC VOID DIA_Hokurn_Hello_END ()
{
	AI_StopProcessInfos (self);
};

FUNC VOID B_Hokurn_Sauf ()
{
	AI_Output (self ,other,"B_Hokurn_Sauf_01_00"); //(рыгает) Ох, какое блаженство!
	AI_Output (self ,other,"B_Hokurn_Sauf_01_01"); //Теперь я опять могу размышлять здраво. Что я могу сделать для тебя?
};

FUNC VOID DIA_Hokurn_Hello_Yes ()
{
	AI_Output (other,self ,"DIA_Hokurn_Hello_Yes_15_00"); //Вот, возьми это.
	
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
	description = "Я принес тебе выпивку.";
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
	AI_Output (other,self ,"DIA_Hokurn_Drink_15_00"); //Я принес тебе выпивку.
	AI_Output (self ,other,"DIA_Hokurn_Drink_01_01"); //(жадно) Давай сюда!!!
	
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
	description = "Мне нужна кое-какая информация.";
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
	AI_Output (other,self ,"DIA_Hokurn_Question_15_00"); //Мне нужна кое-какая информация.
	AI_Output (self ,other,"DIA_Hokurn_Question_01_01"); //(раздраженно) Я думал, ты меня понял. Я говорю только с друзьями.
	AI_Output (self ,other,"DIA_Hokurn_Question_01_02"); //А друзья всегда делятся со мной выпивкой. Понял? Теперь проваливай!
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
	description = "Я ищу человека, который мог бы научить меня чему-нибудь.";
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
	AI_Output (other,self ,"DIA_Hokurn_Learn_15_00"); //Я ищу человека, который мог бы научить меня чему-нибудь.
	AI_Output (self ,other,"DIA_Hokurn_Learn_01_01"); //Я мог бы обучить тебя некоторым вещам. Я лучший боец на многие мили вокруг.
	AI_Output (self ,other,"DIA_Hokurn_Learn_01_02"); //Так как мы друзья, я сделаю тебе скидку. Это будет стоить 300 золотых монет.

	Info_ClearChoices (DIA_Hokurn_Learn);
	Info_AddChoice	(DIA_Hokurn_Learn,"Это слишком дорого для меня.",DIA_Hokurn_Learn_TooExpensive);
	if (Npc_HasItems (other,ItMi_Gold) >= 300)
	{
		Info_AddChoice	(DIA_Hokurn_Learn,"Хорошо, вот деньги.",DIA_Hokurn_Learn_OK);
	};	 
};

FUNC VOID DIA_Hokurn_Learn_TooExpensive ()
{
	AI_Output (other,self ,"DIA_Hokurn_Learn_TooExpensive_15_00"); //Это для меня слишком дорого.
	AI_Output (self ,other,"DIA_Hokurn_Learn_TooExpensive_01_01"); //Слишком дорого? Это меньше, чем любой другой запросил бы на моем месте.
	AI_Output (self ,other,"DIA_Hokurn_Learn_TooExpensive_01_02"); //Ну, сам подумай.
	
	Info_ClearChoices (DIA_Hokurn_Learn);
};

FUNC VOID DIA_Hokurn_Learn_OK ()
{
	AI_Output (other,self ,"DIA_Hokurn_Learn_OK_15_00"); //Хорошо, вот деньги.
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
	description = "Вот твои деньги. Я хочу, чтобы ты обучил меня.";
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
	AI_Output (other,self ,"DIA_Hokurn_PayTeacher_15_00"); //Вот твои деньги. Я хочу, чтобы ты обучил меня.
	AI_Output (self ,other,"DIA_Hokurn_PayTeacher_01_01"); //Ты не пожалеешь!

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
	description = "Вот, держи выпивку.";
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
	AI_Output (other,self ,"DIA_Hokurn_DrinkAndLearn_15_00"); //Вот, держи выпивку.
	
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
	
	AI_Output (self ,other,"DIA_Hokurn_DrinkAndLearn_01_01"); //Мне стало гораздо лучше. Я теперь готов ко всему.

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
	description = "Начнем обучение.";
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
	AI_Output (other,self ,"DIA_Hokurn_Teach_15_00"); //Давай начнем обучение.
	
	if (HokurnLastDrink < Wld_GetDay ())
	{
		AI_Output (self ,other,"DIA_Hokurn_Teach_01_01"); //Сначала принеси мне что-нибудь выпить!
	}
	else
	{	 
		if (hero.guild == GIL_PAL)
		{
			AI_Output (self ,other,"DIA_Hokurn_Teach_01_02"); //А потом мы посмотрим, что можно выжать из твоих ржавых паладинских костей, ха?
		}
		else if (hero.guild == GIL_KDF)
		{
			AI_Output (self ,other,"DIA_Hokurn_Teach_01_03"); //Что ты понимаешь. Даже маги не чуждаются оружия ближнего боя.
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
	AI_Output(self,other,"B_Hokurn_TeachedEnough_01_00"); //Тебе больше не нужен учитель в этом виде боевого искусства.
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
//	Wieso hдngt ihr hier ьberhaupt rum?
//*********************************************************************
INSTANCE DIA_Hokurn_StayHere   (C_INFO)
{
	npc         = DJG_712_Hokurn;
	nr          = 5;
	condition   = DIA_Hokurn_StayHere_Condition;
	information = DIA_Hokurn_StayHere_Info;
	permanent   = FALSE;
	description = "А что ты вообще здесь делаешь, кстати?";
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
	AI_Output (other,self ,"DIA_Hokurn_StayHere_15_00"); //Кстати, а что ты вообще здесь делаешь?
	AI_Output (self ,other,"DIA_Hokurn_StayHere_01_01"); //Если честно, понятия не имею, что мы делаем здесь и когда все начнется.
	AI_Output (self ,other,"DIA_Hokurn_StayHere_01_02"); //И пока у меня есть выпивка, меня это совершенно не волнует.
	
	/*
	AI_Output (other,self ,"DIA_Addon_Hokurn_StayHere_15_00"); //Was wollt ihr hier ьberhaupt?
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
	description = "Ты знаешь, где находятся драконы?";
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
	AI_Output (other,self ,"DIA_Hokurn_WhereDragon_15_00"); //Ты знаешь, где находятся драконы?
	AI_Output (self ,other,"DIA_Hokurn_WhereDragon_01_01"); //А что я получу за то, что скажу это тебе?

	Info_ClearChoices (DIA_Hokurn_WhereDragon);
	Info_AddChoice (DIA_Hokurn_WhereDragon,"Ничего, я сам их найду.",DIA_Hokurn_WhereDragon_FindMyself);
	Info_AddChoice (DIA_Hokurn_WhereDragon,"Я был бы не прочь заплатить тебе за эту информацию.",DIA_Hokurn_WhereDragon_Gold);
	if Npc_HasItems (other,ITFO_BOOZE) >=1
	{
		Info_AddChoice (DIA_Hokurn_WhereDragon,"У меня есть еще одна бутылочка джина!",DIA_Hokurn_WhereDragon_Booze);	 
	};
};

FUNC VOID DIA_Hokurn_WhereDragon_FindMyself ()
{
	AI_Output (other,self ,"DIA_Hokurn_WhereDragon_FindMyself_15_00"); //Ничего, я сам их найду.
	AI_Output (self ,other,"DIA_Hokurn_WhereDragon_FindMyself_01_01"); //Тебе лучше быть поосторожнее. Впереди тебя ждет много кровопролитных боев.
	Info_ClearChoices (DIA_Hokurn_WhereDragon);
};

FUNC VOID DIA_Hokurn_WhereDragon_Gold ()
{
	AI_Output (other,self ,"DIA_Hokurn_WhereDragon_Gold_15_00"); //Я был бы не прочь заплатить тебе за эту информацию.
	AI_Output (self ,other,"DIA_Hokurn_WhereDragon_Gold_01_01"); //Заплатить мне? Хмм. Хорошо, я продам тебе эту информацию за 200 золотых монет.
	
	Info_ClearChoices (DIA_Hokurn_WhereDragon);
	Info_AddChoice (DIA_Hokurn_WhereDragon,"Это слишком много!",DIA_Hokurn_WhereDragon_TooMuch);
	if Npc_HasItems (other,ItMi_Gold) >=200
	{
		Info_AddChoice (DIA_Hokurn_WhereDragon,"Договорились. Вот твои деньги!",DIA_Hokurn_WhereDragon_OK);
	};
};

FUNC VOID DIA_Hokurn_WhereDragon_TooMuch ()
{
	AI_Output	(other,self ,"DIA_Hokurn_WhereDragon_TooMuch_15_00"); //Это слишком много!
	AI_Output 	(self ,other,"DIA_Hokurn_WhereDragon_TooMuch_01_01"); //Тогда забудь об этом.
	Info_ClearChoices	(DIA_Hokurn_WhereDragon); 
};

FUNC VOID DIA_Hokurn_WhereDragon_OK ()
{
	AI_Output (other,self ,"DIA_Hokurn_WhereDragon_OK_15_00"); //Договорились. Вот твои деньги!
	B_GiveInvItems (other,self,ItMi_gold,200);
	
	HokurnTellsDragon = TRUE;
	Info_ClearChoices (DIA_Hokurn_WhereDragon);
};

FUNC VOID DIA_Hokurn_WhereDragon_Booze ()
{
	AI_Output (other,self ,"DIA_Hokurn_WhereDragon_Booze_15_00"); //У меня есть еще одна бутылочка джина!
	AI_Output (self ,other,"DIA_Hokurn_WhereDragon_Booze_01_01"); //За хорошее вино я готов сразиться со всеми драконами мира.
	AI_Output (self ,other,"DIA_Hokurn_WhereDragon_Booze_01_02"); //Договорились. Давай мне эту бутылку!
	B_GiveInvItems ( other,self,ItFo_booze,1);
	AI_Output (self ,other,"DIA_Hokurn_WhereDragon_Booze_01_03"); //Я припасу ее на черный день.

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
	description = "Хорошо, теперь скажи, где все эти драконы?";
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
	AI_Output (other,self ,"DIA_Hokurn_Dragon_15_00"); //Хорошо, теперь скажи, где все эти драконы?
	AI_Output (self ,other,"DIA_Hokurn_Dragon_01_01"); //Ну, если честно, я не могу сказать тебе ничего определенного, но я слышал, что всего должно быть четыре дракона.
	AI_Output (self ,other,"DIA_Hokurn_Dragon_01_02"); //Прошлой ночью над самой высокой горой мы видели багровое свечение.
	AI_Output (self ,other,"DIA_Hokurn_Dragon_01_03"); //Готов поклясться свой матерью, что если ты ищешь драконов, одного из них ты найдешь там.
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
	description	= "Я убил всех драконов.";
				
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
	AI_Output	(other,self ,"DIA_Hokurn_AllDragonsDead_15_00"); //Я убил всех драконов.
	AI_Output 	(self ,other,"DIA_Hokurn_AllDragonsDead_01_01"); //Иди, рассказывай сказки кому-нибудь другому.
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




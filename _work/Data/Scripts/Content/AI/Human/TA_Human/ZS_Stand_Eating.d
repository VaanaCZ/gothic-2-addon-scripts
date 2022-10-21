// *********************
// NSC benutzt Item Food
// *********************

func void ZS_Stand_Eating()
{
	Perception_Set_Normal();
	
	B_ResetAll (self);
	
	AI_SetWalkmode 	(self,NPC_WALK);
		
	if (Npc_GetDistToWP (self,self.wp) > TA_DIST_SELFWP_MAX) 
	{
		AI_GotoWP	(self, self.wp);
	};
	
	self.aivar[AIV_TAPOSITION] = NOTINPOS;
		
	var int random;
	random = Hlp_Random(4);
	
	if (random == 0)	
	{	
		if (Npc_HasItems (self,ItFo_Apple) == 0)
		{
			CreateInvItem (self,ItFo_Apple);	
		};
		self.aivar[AIV_Food] = 		FOOD_Apple;
	}
	else if (random == 1)	
	{	
		if (Npc_HasItems (self,ItFo_Cheese) == 0)
		{
			CreateInvItem (self,ItFo_Cheese);	
		};
		self.aivar[AIV_Food] = 		FOOD_Cheese;
	}
	else if (random == 2)	
	{	
		if (Npc_HasItems (self,ItFo_Bacon) == 0)
		{
			CreateInvItem (self,ItFo_Bacon);	
		};	
		self.aivar[AIV_Food] = 		FOOD_Bacon;
	}
	else if (random == 3)	
	{	
		if (Npc_HasItems (self,ItFoMutton) == 0)
		{
			CreateInvItem (self,ItFoMutton);	
		};	
		self.aivar[AIV_Food] = 		FOOD_Bread;
	};	
	
};

func int ZS_Stand_Eating_Loop ()
{
	if (Npc_IsOnFP (self, "STAND"))
	{	
		AI_AlignToFP (self);
		if (self.aivar[AIV_TAPOSITION] == NOTINPOS_WALK)
  		{
  			self.aivar[AIV_TAPOSITION] = NOTINPOS;
  		};
	}	
	else if (Wld_IsFPAvailable(self,"STAND"))
	{
		AI_GotoFP 		(self, "STAND");
		AI_StandUp 		(self);
		AI_AlignToFP 	(self);
		self.aivar[AIV_TAPOSITION] = NOTINPOS_WALK;
	}
	else
	{
		AI_AlignToWP (self);
		if (self.aivar[AIV_TAPOSITION] == NOTINPOS_WALK)
  		{
  			self.aivar[AIV_TAPOSITION] = NOTINPOS;
  		};
	};	

	if (self.aivar[AIV_TAPOSITION] == NOTINPOS)
	{			
		if (self.aivar[AIV_Food] == FOOD_Apple)	
		{	
			AI_UseItemToState 		(self, 	ItFo_Apple, 0);	
			AI_PlayAniBS 			(self,"T_FOOD_RANDOM_2",BS_ITEMINTERACT);
			self.aivar[AIV_TAPOSITION] = ISINPOS;
		}
		if (self.aivar[AIV_Food] == FOOD_Cheese)		
		{	
			AI_UseItemToState 		(self, 	ItFo_Cheese, 0);
			self.aivar[AIV_TAPOSITION] = ISINPOS;	
		}
		if (self.aivar[AIV_Food] == FOOD_Bacon)
		{	
			AI_UseItemToState 		(self, 	ItFo_Bacon, 0);
			self.aivar[AIV_TAPOSITION] = ISINPOS;	
		}
		if (self.aivar[AIV_Food] == FOOD_Bread)
		{	
			AI_UseItemToState 		(self, 	ItFoMutton, 0);
			self.aivar[AIV_TAPOSITION] = ISINPOS;	
		};
	};		


	//*****************************************************************************
	//--- SK:Hier werden random ANis gespielt. Normaler PlayAni resettet den BS, es
	//--- gab dann Probleme mit dem Abbrechen der Loop --> AI_PLayANIBS notwendig
	//*****************************************************************************

	if ((Npc_GetStateTime(self) > 5)
	&& (self.aivar[AIV_TAPOSITION] == ISINPOS))
	{
		if (self.aivar[AIV_Food] == FOOD_Apple)
		{
			AI_PlayAniBS (self,"T_FOOD_RANDOM_1",BS_ITEMINTERACT); //kleines Food essen
		}
		else if (self.aivar[AIV_Food] == FOOD_Bacon)||(self.aivar[AIV_Food] == FOOD_Bread)
		{
			AI_PlayAniBS (self,"T_MEAT_RANDOM_1",BS_ITEMINTERACT); //Bollen essen
		}
		else //Cheese oder Bread
		{
			AI_PlayAniBS (self,"T_FOODHUGE_RANDOM_1",BS_ITEMINTERACT); //grosses Food essen
		};
		Npc_SetStateTime (self, 0);
	};
	
	return LOOP_CONTINUE;
};

func void ZS_Stand_Eating_End ()
{
	AI_PlayAniBS (self,"T_POTION_RANDOM_2",BS_ITEMINTERACT); //Mund abwischen
	
	if (self.aivar[AIV_Food] == FOOD_Apple)		{	AI_UseItemToState 	(self, 	ItFo_Apple, -1);	};
	if (self.aivar[AIV_Food] == FOOD_Cheese)	{	AI_UseItemToState 	(self, 	ItFo_Cheese,-1);	};
	if (self.aivar[AIV_Food] == FOOD_Bacon)		{	AI_UseItemToState 	(self, 	ItFo_Bacon, -1);	};
	if (self.aivar[AIV_Food] == FOOD_Bread)		{	AI_UseItemToState 	(self, 	ItFoMutton, -1);	};
};

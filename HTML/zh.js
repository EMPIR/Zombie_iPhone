// In case we forget to take out console statements. IE becomes very unhappy when we forget. Let's not make IE unhappy
if(typeof(console) === 'undefined') {
    var console = {}
    console.log = console.error = console.info = console.debug = console.warn = console.trace = console.dir = console.dirxml = console.group = 	console.groupEnd = console.time = console.timeEnd = console.assert = console.profile = function() {};
}

Number.prototype.mod = function(n) {
	return ((this%n)+n)%n;
}
Number.randomNumber= function(floor, ceiling)
{
	return Math.round((Math.random() * ceiling)) + floor;
}


ZH = (function(){
	var MEDIA_ROOT = "../MEDIA_Doghouse_iPhone/";
	var ZMEDIA = "../MEDIA_Zombie_iPhone/";
	var DMEDIA = "../MEDIA_Doghouse_iPhone/";
	//MEDIA_ROOT = ZMEDIA;
	var StringConst = {
		
		IMG_BRAINS : MEDIA_ROOT + "Brains/brains_%d.png",
		IMG_PIECE_A : MEDIA_ROOT + "Pieces/%d%d%d0a.png",
		IMG_PIECE_B	: MEDIA_ROOT + "Pieces/%d%d%d0b.png",
	};
	
	var drop_list_item_template = '<div id={id} class="drop_list_item">'+
								'<div class="image">'+
									'<img src="{thumbnail}">'+
								'</div>'+
							    '<div class="text">'+
									'<p>{description}</p>'+
								'</div>'+
							   '</div>';
							
							
	var BrainPiece = function(image,speed,x,y,height,width)
	{
		this.image=  image;
		this.speed = speed;
		this.x = x;
		this.y = y;
		this.height = height;
		this.width = width;
	};
	
	BrainPiece.prototype={
		randomize: function(){
			speed = Number.randomNumber(1,5);
			x = Number.randomNumber(1,459);
			y = Number.randomNumber(1,300);
			width = Number.randomNumber(10,50);
			height = width * 0.66666667;
		},	
	};
	
	var BrainPieces = function()
	{
		this.pieces = this.CreatePieces();
	};
	
	BrainPieces.prototype={
		CreatePieces : function(){
			var ret = new Array();
			for (var i = 1; i <= 60; ++i)
			{
				imageObj = new Image();
				imageObj.src = sprintf(StringConst.IMG_BRAINS, (i % 30)+1);
				imageObj.onload = function() {
					var speed = Number.randomNumber(1,5);
					var width = Number.randomNumber(10,50);
					var height = width * (this.height / this.width);

					var x = Number.randomNumber(1,480 - width); //480
					var y = Number.randomNumber(1,320 - height); //320
					ret.push(new BrainPiece(this,speed,x,y,height,width));
				}				
			}
			return ret;
			
		},
	};
		
	
	var Score = function(id,gameType,score,date)
	{
		this.id = id;
		this.gameType= gameType;
		this.score = score;
		this.date = date;
	};					
	
	Score.prototype = {
		
	};	
	
	var SetGame = function()
	{
		var GameType = {
			Normal : 1,
			Countdown : 2,
			Hard : 3
		};
		this.gameType = 2;
		this.totalPieces = 27;
		this.pieces = new Array();
		this.state = new Array();
		
		this.matches = new Array();
		this.pressed_state = new Array();
		for(var i=0;i<12;++i)
		{
			this.pressed_state.push(0);
		}
		this.startDate = new Date();
		
		this.count = 0;
		this.totalMoves = 0;
		this.currentMove = 0;
		this.selection_a = -1;
		this.selection_b = -1;
		this.selection_c = -1;
		this.setsComplete = 0;
		this.totalTime = 0;
		this.gameTime = 60; //seconds
		this.currentTime = 0;
		this.gameScore = 0;
		
		this.isActive = false;
		this.showHint = false;
		this.isPaused = false;
		
		this.match = false;
		this.finishedDate = new Date();
		this.setLogic = new SetLogic();
		
	};
	SetGame.prototype = {
		move: function(a,b,c)
		{
			if(this.setLogic.ContainsMatch(this.pieces[a],this.pieces[b],this.pieces[c]))
			{
				return true;
			}
			return false;
		},
		
		moveScore: function()
		{
			/*
			 moveScore{
				int a = [[state objectAtIndex:selection_a-1] intValue];
				int b = [[state objectAtIndex:selection_b-1] intValue];
				int c = [[state objectAtIndex:selection_c-1] intValue];

				NSLog(@"Making Move %d %d %d", a,b,c);


				count = 0;
				BOOL ret = [self score:a:b:c];
				return ret;
			}
			*/
		},
		
		makeMove: function()
		{
			/*
			int a = [[state objectAtIndex:selection_a-1] intValue];
				int b = [[state objectAtIndex:selection_b-1] intValue];
				int c = [[state objectAtIndex:selection_c-1] intValue];

				NSLog(@"Making Move %d %d %d", a,b,c);


				count = 0;
				BOOL ret = [self move:a:b:c];
				if(ret)
				{
					gameScore += [self score:a:b:c];
				}
				return ret;
			*/
			
		},
		getMatch: function()
		{
			//return [SetLogic GetMatchIndices:pieces:state];
		},
		newGame: function(gameType,gameDifficulty, callback)
		{
			if(gameDifficulty < 0)
				gameDifficulty = 0;
				
			/*
			totalPieces = [SetLogic GetLevelTotal:gl];
			pieces =[[SetLogic CreateLevelPieces:gl] retain];
			state = [[SetLogic CreateState:pieces:totalPieces] retain];
			*/	
			
			this.totalPieces = this.setLogic.GetLevelTotal(gameDifficulty);
			this.pieces = this.setLogic.CreateLevelPieces(gameDifficulty,function(){
				callback();
			});
			this.state = this.setLogic.CreateState(this.pieces,this.totalPieces);

			this.gameType = gameType;
			this.reset();
			
			
			
			
		},
		onPress: function(button)
		{
			/*
			if(count == 0)
				{
					selection_a = button;
					count ++;
					NSLog(@"count = %d, selection a = %d", count, selection_a);
					return YES;
				}
				if(count == 1)
				{
					if(selection_a == button)
					{
						selection_a = -1;
						count --;
						NSLog(@"count = %d, selection a = %d", count, selection_a);
						return NO;
					}
					else {
						selection_b = button;
						count ++;
						NSLog(@"count = %d, selection a = %d, selection b = %d", count,selection_a,selection_b);
						return YES;
					}
				}
				else if(count ==2)
				{
					if(selection_a == button)
					{
						selection_a = selection_b;
						selection_b = -1;
						count --;
						NSLog(@"count = %d, selection a = %d, selection b = %d", count,selection_a,selection_b);
						return NO;
					}
					else if(selection_b == button)
					{
						selection_b = -1;
						count --;
						NSLog(@"count = %d", count);
						return NO;
					}
					else {
						selection_c = button;
						count ++;
						NSLog(@"count = %d, selection a = %d, selection b = %d, selection c = %d", count,selection_a,selection_b,selection_c);
						return YES;

					}

				}
				else if(count == 3)
				{
					if(selection_a == button)
					{
						selection_a = selection_b;
						selection_b = selection_c;
						selection_c = -1;
						count --;
						NSLog(@"count = %d, selection a = %d, selection b = %d", count,selection_a,selection_b);
						return NO;
					}
					else if(selection_b == button)
					{
						selection_b = selection_c;
						selection_c = -1;
						count --;
						NSLog(@"count = %d, selection a = %d, selection b = %d", count,selection_a,selection_b);
						return NO;
					}
					else if(selection_c == button)
					{
						selection_c = -1;
						count --;
						NSLog(@"count = %d, selection a = %d, selection b = %d", count,selection_a,selection_b);
						return NO;
					}

				}
				NSLog(@"count = %d", count);
				return NO;
			*/
			
		},
		isFinished:function()
		{
			if(gameType == 1)
			{
				if(currentMove < totalMoves)
					return false;
			}
			if(gameType == 2)
			{
				if(currentTime < gameTime)
					return false;
			}
			return true;
			
		},
		SwitchPieces: function(){
			/*
			[SetLogic GetNewPieces:selection_a-1:selection_b-1:selection_c-1:state:pieces:totalPieces];

				selection_a = selection_b = selection_c = -1;
			*/
		},
		GameLoop:function(){
			/*
			NSLog(@"Game Loop start");

				NSLog(@"Game Loop end");
			*/
		},
		GetNewPieces:function(a,b,c){
			this.setLogic.GetNewPieces(a,b,c,this.state,this.pieces,this.totalPieces);	
		},
		reset:function()
		{
			selection_a = selection_b = selection_c = -1;
				
			startDate = new Date();
			totalTime = 0;
			count = 0;
			totalMoves = 10;
			currentMove = 0;
			selection_a = -1;
			selection_b = -1;
			selection_c = -1;
			setsComplete = 0;
			gameTime = 60; //seconds
			currentTime = 0;
			gameScore = 0;

			isActive = false;
			showHint = true;
			isPaused = false;
			
		}
	};

	
	var SetPiece = function(color,fill,shape,number)
	{
		var Color = {
			Red: 1,
			Green: 2,
			Blue: 3
		};
		var Fill= 
		{
			Solid : 1,
			Hollow : 2,
			Striped : 3
		};

		var Shape =
		{
			Diamond: 1,
			Cylinder:2,
			Squiggle:3
		};

		var Number =
		{
			One:1,
			Two : 2,
			Three : 3
		};
		
		this.shape = shape;
		this.color = color;
		this.fill = fill;
		this.number = number;
		this.isDown = false;
		this.imageStr = '';
		this.image2Str=  '';
		
		
		
	};
	SetPiece.prototype = {
		print : function()
		{
			console.log('color = '+ this.color +
			'shape = '+ this.shape +
			'fill = '+ this.fill +
			'imageSrc = ' + this.image.src 
			);
		},
		isEqual: function(other)
		{
			return	(this.shape  != other.shape) && 
						(this.color  != other.color) &&
						(this.fill  != other.fill)  && 
						(this.number != other.number);
			
		},
		loadImages: function(callback)
		{
			this.image = new Image();
			this.image2 = new Image();
			this.image.src = this.imageStr;
			this.image2.src = this.image2Str;
			this.image.onload =function(image2,callback){
				
				image2.onload =function(){
					callback();
				}
			}
			
			
		}
	};

	var SetLogic = function()
	{
		this.totalLevels = 45;
		this.levelstartstop =   new Array(1,1, 1,3, 1,1, //level 1  - 1 head, 3 color, 1 shade = 3
								1,1, 1,3, 2,2, //level 2  - 1 head, 3 color, 1 shade = 3
								1,1, 1,3, 3,3, //level 3  - 1 head, 3 color, 1 shade = 3

								1,1, 1,3, 1,2, //level 4  - 1 head, 3 color, 2 shade = 6
								1,1, 1,3, 2,3, //level 5  - 1 head, 3 color, 2 shade = 6
								1,2, 1,3, 1,1, //level 6  - 2 head, 3 color, 1 shade = 6
								1,2, 1,3, 2,2, //level 7  - 2 head, 3 color, 1 shade = 6
								1,2, 1,3, 3,3, //level 8  - 2 head, 3 color, 1 shade = 6
								1,2, 1,3, 3,3, //level 9  - 2 head, 3 color, 1 shade = 6

								1,2, 1,2, 1,2, //level 10 - 2 head, 2 color, 2 shade = 8
								1,2, 2,3, 1,2, //level 11 - 2 head, 2 color, 2 shade = 8
								1,2, 1,2, 2,3, //level 12 - 2 head, 2 color, 2 shade = 8
								1,2, 2,3, 2,3, //level 13 - 2 head, 2 color, 2 shade = 8
								2,3, 1,2, 1,2, //level 14 - 2 head, 2 color, 2 shade = 8
								2,3, 2,3, 1,2, //level 15 - 2 head, 2 color, 2 shade = 8
								2,3, 1,2, 2,3, //level 16 - 2 head, 2 color, 2 shade = 8
								2,3, 2,3, 2,3, //level 17 - 2 head, 2 color, 2 shade = 8	

								1,1, 1,3, 1,3, //level 18 - 1 head, 3 color, 3 shade = 9
								2,2, 1,3, 1,3, //level 19 - 1 head, 3 color, 3 shade = 9
								3,3, 1,3, 1,3, //level 20 - 1 head, 3 color, 3 shade = 9
								1,3, 1,1, 1,3, //level 21 - 3 head, 1 color, 3 shade = 9
								1,3, 2,2, 1,3, //level 22 - 3 head, 1 color, 3 shade = 9
								1,3, 3,3, 1,3, //level 23 - 3 head, 1 color, 3 shade = 9
								1,3, 1,3, 1,1, //level 24 - 3 head, 3 color, 1 shade = 9
								1,3, 1,3, 2,2, //level 25 - 3 head, 3 color, 1 shade = 9
								1,3, 1,3, 3,3, //level 26 - 3 head, 3 color, 1 shade = 9

								1,3, 1,2, 1,2, //level 27 - 3 head, 2 color, 2 shade = 12
								1,3, 2,3, 1,2, //level 28 - 3 head, 2 color, 2 shade = 12
								1,3, 1,2, 2,3, //level 29 - 3 head, 2 color, 2 shade = 12
								1,3, 2,3, 2,3, //level 30 - 3 head, 2 color, 2 shade = 12
								1,2, 1,3, 1,2, //level 31 - 2 head, 3 color, 2 shade = 12
								1,2, 1,3, 2,3, //level 32 - 2 head, 3 color, 2 shade = 12
								2,3, 1,3, 1,2, //level 33 - 2 head, 3 color, 2 shade = 12
								2,3, 1,3, 2,3, //level 34 - 2 head, 3 color, 2 shade = 12
								1,2, 1,2, 1,3, //level 35 - 2 head, 2 color, 3 shade = 12
								2,3, 1,2, 1,3, //level 36 - 2 head, 2 color, 3 shade = 12
								1,2, 2,3, 1,3, //level 37 - 2 head, 2 color, 3 shade = 12
								2,3, 2,3, 1,3, //level 38 - 2 head, 2 color, 3 shade = 12

								1,3, 1,3, 1,2, //level 39 - 3 head, 3 color, 2 shade = 18
								1,3, 1,3, 2,3, //level 40 - 3 head, 3 color, 2 shade = 18
								1,3, 1,2, 1,3, //level 41 - 3 head, 2 color, 3 shade = 18
								1,3, 2,3, 1,3, //level 42 - 3 head, 2 color, 3 shade = 18
								1,2, 1,3, 1,3, //level 43 - 2 head, 3 color, 3 shade = 18
								2,3, 1,3, 1,3, //level 44 - 2 head, 3 color, 3 shade = 18

								1,3, 1,3, 1,3 //level 45 - 3 head, 3 color, 3 shade = 27

							   );
	};
	
	SetLogic.prototype= {
		CreatePiece : function()
		{
			return new SetPiece(Number.randomNumber(1,3),
								 Number.randomNumber(1,3),
								 Number.randomNumber(1,3),
								 Number.randomNumber(1,3)
								 );
			
		},
		
		Contains : function(piece, pieces)
		{
			for(var i=0;i<pieces.length;++i)
			{
				if(piece.isEqual(pieces[i]))
					return true;
			}
			return false;
		},
		/// <summary>
		/// Creates a Set Piece with Random color, number, shape, fill that does not exist in the
		/// given list of pieces
		/// </summary>
		/// <returns></returns>
		CreatePiece : function(pieces)
		{
			var cont = false;
				
			var p = this.CreatePiece();
			while(cont)
			{
				if(this.Contains(p,pieces))
				{
					cont = false;
				}
				else{
					p = this.CreatePiece();
				}
			}
			return p;
		},
		
		CreateSimplePiece : function(){
			var p = this.CreatePiece();
			p.fill = 1;
			return p;
		},
		
		CreatePieces : function(total)
		{
			var ret = new Array();
			for(var i=0; i<total; ++i)
			{
				ret.push(this.CreatePiece());
			}
			return ret;
			
		},
		
		CreateSimplePieces : function(total)
		{
			var ret = new Array();
			for(var i=0; i<total; ++i)
			{
				ret.push(this.CreateSimplePiece());
			}
			return ret;
			
		},
		/*CreateRandomSet : function()
		{
			
		},*/
		/// <summary>
		/// This routine determines if the set of pieces contains a Set Match.
		/// If there are less than 3 pieces in the list, then the routine automatically
		/// returns false. If there are 3 or more, then all possible combinations of
		/// 3 pieces are examined for a match. If a match is found, the returning
		/// list of integers is filled with the 3 indexes that makes the match in the
		/// input array. If no matches are found, the returned list is empty.
		/// </summary>
		/// <param name="pieces"></param>
		/// <returns></returns>
		ContainsMatch2 : function( pieces, state){
			console.log('calling containsmatch(pieces, state)');
			var ret = new Array();
			if(pieces.length < 3)
				return ret;
				
				
			var p1; //permutation runner
			var r1; //runner 1
			var r2; //runner 2	
			
			for(p1 = 0; p1 < state.length - 2; ++p1)
			{
				for (r1 = p1 + 1; r1 < state.length - 1; ++r1)
				{
					for(r2 = r1 + 1; r2 < state.length; ++r2)
					{
						var a = state[p1];
						var b = state[r1];
						var c = state[r2];
					
						if(this.ContainsMatch(pieces[a],pieces[b],pieces[c]))
						{
							console.log(sprintf("Found match: %d %d %d", p1,r1,r2));
							ret.push(state[p1]);
							ret.push(state[r1]);
							ret.push(state[r2]);
							console.log("ContainsMatch End, Found Match");
							return ret;
						}
					}
				}
			}

			//no matches were found, so return the empty list;
			console.log("ContainsMatch End, No Match Found!");
			return null;
			
		},
		
		isMatch: function(pieces,state){
			if(pieces.length < 3)
				return false;
				
				
			var p1; //permutation runner
			var r1; //runner 1
			var r2; //runner 2	
			
			for(p1 = 0; p1 < state.length - 2; ++p1)
			{
				for (r1 = p1 + 1; r1 < state.length - 1; ++r1)
				{
					for(r2 = r1 + 1; r2 < state.length; ++r2)
					{
						var a = state[p1];
						var b = state[r1];
						var c = state[r2];
						//console.log('state.length = '+state.length+' p1 '+p1+' r1 '+r1+' r2 '+r2);
						//console.log(a+' '+b+' '+c);
						if(this.ContainsMatch(pieces[a],pieces[b],pieces[c]))
						{
							return true;
						}
					}
				}
			}

			//no matches were found, so return the empty list;
			console.log("ContainsMatch End, No Match Found!");
			return false;
			
		},
		
		ContainsMatch : function(a,b,c){
			if (!this.Match(a.number, b.number, c.number))
				return false;
			if (!this.Match(a.color, b.color, c.color))
				return false;
			if (!this.Match(a.shape, b.shape, c.shape))
				return false;
			if (!this.Match(a.fill, b.fill, c.fill))
				return false;	
					
			return true;
		},
		
		
		/// <summary>
		/// This routine determines if the set of pieces contains a Set Match.
		/// If there are less than 3 pieces in the list, then the routine automatically
		/// returns false. If there are 3 or more, then all possible combinations of
		/// 3 pieces are examined for a match. If a match is found, the returning
		/// list of integers is filled with the 3 indexes that makes the match in the
		/// input array. If no matches are found, the returned list is empty.
		/// </summary>
		/// <param name="pieces"></param>
		/// <returns></returns>
		GetMatchIndices : function(pieces, state)
		{
			var ret = new Array();
			if(pieces.length < 3)
				return ret;
				
				
			var p1; //permutation runner
			var r1; //runner 1
			var r2; //runner 2	
			
			for(p1 = 0; p1 < state.length - 2; ++p1)
			{
				for (r1 = p1 + 1; r1 < state.length - 1; ++r1)
				{
					for(r2 = r1 + 1; r2 < state.length; ++r2)
					{
						var a = state[p1];
						var b = state[r1];
						var c = state[r2];
					
						if(this.ContainsMatch(pieces[a],pieces[b],pieces[c]))
						{
							console.log(sprintf("Found match: %d %d %d", p1,r1,r2));
							ret.push(p1);
							ret.push(r1);
							ret.push(r2);
							console.log("ContainsMatch End, Found Match");
							return ret;
						}
					}
				}
			}

			//no matches were found, so return the empty list;
			console.log("ContainsMatch End, No Match Found!");
			return null;
		},
		
		
		Match: function(a, b, c)
		{
			if ((a == b && b == c) || (a != b && b != c && a != c))
			{
				return true;
			}
			return false;
		},
		
		
		/*CreateEasyPieces: function()
		{
			var ret = new Array();
			for (var i = 1; i <= 3; ++i)
			{
				for (var j = 1; j <= 3; ++j)
				{
					for (var k = 1; k <= 1; ++k)
					{
						for (var l = 1; l <= 1; ++l)
						{
							
							
							imageObj = new Image();
							imageObj2 = new Image();
							console.log(imageObj.src);
							var setPiece = new SetPiece(i,j,k,l,null,null);
							setPiece.imageStr = sprintf(StringConst.IMG_PIECE_A,i,j,k,l);
							setPiece.image2Str = sprintf(StringConst.IMG_PIECE_B,i,j,k,l);
							ret.push(setPiece);
							setPiece.loadImages(function(){
								
							});
							
							

						}
					}
				}
			}
			return ret;
			
		},
		
		
		CreateMediumPieces: function()
		{
			var ret = new Array();
			for (var i = 1; i <= 3; ++i)
			{
				for (var j = 1; j <= 3; ++j)
				{
					for (var k = 1; k <= 3; ++k)
					{
						for (var l = 0; l <= 0; ++l)
						{
							
							
							imageObj = new Image();
							imageObj2 = new Image();
							console.log(imageObj.src);
							var setPiece = new SetPiece(i,j,k,l,null,null);
							setPiece.imageStr = sprintf(StringConst.IMG_PIECE_A,i,j,k,l);
							setPiece.image2Str = sprintf(StringConst.IMG_PIECE_B,i,j,k,l);
							ret.push(setPiece);
							setPiece.loadImages(function(){});
							
							

						}
					}
				}
			}
			return ret;
			
		},
		*/
		
		/// <summary>
		/// Creates the set of total pieces into an array
		/// </summary>
		CreateHardPieces: function(callback)
		{
			var ret = new Array();
			for (var i = 1; i <= 3; ++i)
			{
				for (var j = 1; j <= 3; ++j)
				{
					for (var k = 1; k <= 3; ++k)
					{
						for (var l = 1; l <= 3; ++l)
						{
							imageObj = new Image();
							imageObj2 = new Image();
							console.log(imageObj.src);
							var setPiece = new SetPiece(i,j,k,l,null,null);
							setPiece.imageStr = sprintf(StringConst.IMG_PIECE_A,i,j,k,l);
							setPiece.image2Str = sprintf(StringConst.IMG_PIECE_B,i,j,k,l);
							ret.push(setPiece);
							setPiece.loadImages(function(callback){
								callback();
							});
						}
					}
				}
			}
			return ret;
			
			
		},
		/*DeletePieces: function()
		{
			
		},*/
		
		
		GetTotalLevels : function(){
			return totalLevels;
		},
		
		GetLevelStart: function(level){
			return level * 6;
		},
		
		GetLevelTotal:function(level){
			var s = this.GetLevelStart(level);
			var headTotal = (this.levelstartstop[s+1] - this.levelstartstop[s]) + 1;
			var colorTotal = (this.levelstartstop[s+3] - this.levelstartstop[s+2]) + 1;
			var shadeTotal = (this.levelstartstop[s+5] - this.levelstartstop[s+4]) + 1;
			return headTotal * colorTotal * shadeTotal;
		},
		
		MatchScore : function(a,b,c)
		{
			var ret = 1;

			if(!ContainsMatch(a,b,c))
				return 0;

			if(a.number != b.number)
			{
				console.log('Numbers are different');
				ret = (ret+1); //   always the same currently
			}
			if(a.color != b.color)
			{
				console.log('Colors are different');
				ret = (ret+1)*2; // 4
			}
			if(a.shape != b.shape)
			{
				console.log('Shapes are different');
				ret = (ret+1)*2; // 10
			}
			if(a.fill != b.fill)
			{
				console.log('Fill are different');
				ret = (ret+1)*2; // 22
			}
			return ret;
			
		},
		
		CreateState : function(pieces, state,totalPieces)
		{
			console.log('CreateState');
			var again = true;
			while(again){
				for(var i=0;i<12;++i){
					var ra = Number.randomNumber(0,totalPieces - 1);
					console.log('dg Creating State: ' + i + ' ' + ra);
					state[i] = ra;	
				}
				console.log('here');
				if(this.ContainsMatch2(pieces,state))
				{
					again = false;


				}
				else {
					ret = new Array();
				}

			}
			return ret;
		},
		
		GetNewPieces: function(a,b,c,state,pieces,totalPieces)
		{
			console.log('GetNewPieces Start');
			var again = true;
			while(again){
				var ra = Number.randomNumber(0,totalPieces - 1);
				console.log('prev = ' + a +' '+ state[a] +' new = ' + ra);
				state[a] = ra;
				
				ra = Number.randomNumber(0,totalPieces - 1);
				console.log('prev = ' + state[b] +' new = ' + ra);
				state[b] =  ra;
				
				ra = Number.randomNumber(0,totalPieces - 1);
				console.log('prev = ' + state[c] +' new = ' + ra);
				state[c] =  ra;

				var ans = this.isMatch(pieces,state);

				if(ans)
				{
					again = false;
				}
			}
			for(var j=0;j<state.length;++j)
			console.log('state = ' + state[j]);
			console.log('GetNewPieces End');
		},
		
		CreateState:function(pieces,totalPieces)
		{
			var ret = new Array();
			var again = true;
			while(again){
				for(var i=0;i<12;++i){
					var ra = Number.randomNumber(0,totalPieces - 1);
					console.log('- Creating State: ' + i + ' ' + ra);
					ret.push(ra)	
				}
				console.log('contains match '+ pieces +' '+ ret);
				if(this.ContainsMatch2(pieces,ret))
				{
					again = false;


				}
				else {
					ret = new Array();
				}

			}
			return ret;
			
		},
		
		CreateLevelPieces:function(level){
			var ret = new Array();
			var s = this.GetLevelStart(level);
			console.log('getlevelstart = '+s);
			console.log(this.levelstartstop[s] +' '+ this.levelstartstop[s+1]);
			for (var i = this.levelstartstop[s]; i <= this.levelstartstop[s+1]; ++i)
			{
				for (var j = this.levelstartstop[s+2]; j <= this.levelstartstop[s+3]; ++j)
				{
					for (var k = this.levelstartstop[s+4]; k <= this.levelstartstop[s+5]; ++k)
					{
						for (var l = 1; l <= 1; ++l)
						{
							
							imageObj = new Image();
							imageObj2 = new Image();
							console.log(imageObj.src);
							var setPiece = new SetPiece(i,j,k,l,null,null);
							setPiece.imageStr = sprintf(StringConst.IMG_PIECE_A,i,j,k,l);
							setPiece.image2Str = sprintf(StringConst.IMG_PIECE_B,i,j,k,l);
							ret.push(setPiece);
							setPiece.loadImages(function(){
								
							});
						
						
						}
					}
				}
			}
			return ret;
		}
	};

	var GamePieces = function()
	{
		this.indices = new Array();
	};
	
	GamePieces.prototype={
		length: function(){
			return this.indices.length;
		},
		empty: function(){
			this.indices = [];
		},
		contains: function(obj) {
	    	for (var i = 0; i < this.indices.length; i++) {
	        	if (this.indices[i] === obj) {
	            	return true;
	        	}
	    	}
	    	return false;
		},
		push : function(obj)
		{
			this.indices.push(obj);
		},
		val : function(index)
		{
			return this.indices[index];
		},

		remove: function(obj) {
	    	for (var i = 0; i < this.indices.length; i++) {
	        	if (this.indices[i] === obj) {
	            	this.indices.splice(i,1);
	        	}
	    	}
	    	return false;
		}
		
	};

	var Game = function(canvas, context, callback)
	{
		var self = this;
		this._events = {};
		this.canvas = canvas;
		this.context = context;
		
		this.setGame = new ZH.SetGame();
		this.setGame.newGame(2,44,function(){
			
			
		});
		
		this.score = parseInt(0);
		this.currentTime = 0;
		this.addTime = 80;
			
		this.columns = 4;
		this.selectedPieces = new GamePieces();
		this.pOffX = 30;
		this.pOffY = 60;
		this.column = 0;
		this.row = 0;
		this.selectedIndex = 0;
		
		this.gameStates= ['start','playing', 'end'];
		this.gameState = this.gameStates[0];
		this.background = new Image();
		this.wrongImg = new Image();
		this.correctImg = new Image();
		this.selectedImg = new Image();
		this.startScreen = new Image();
		this.selectedImg.src = ZH.MEDIA_ROOT + "selected.png";
		this.background.src = ZH.MEDIA_ROOT + "bg_GamePlay.jpg";
		this.startScreen.src = ZH.MEDIA_ROOT + "bg_Splash.jpg";
		this.wrongImg.src = ZH.MEDIA_ROOT + 'allBad.png';
		this.correctImg.src = ZH.MEDIA_ROOT + 'allGood.png';
		this.drawState= 0;
		var totalimages= 5;
		var loadedImages = 0;
		function loadImages(){
			loadedImages ++;
			if(loadedImages ==totalimages)
			{
				self.drawOpeningScreen();
				//callback();
			}
		}; 
		this.background.onload = loadImages;
		this.wrongImg.onload = loadImages;
		this.correctImg.onload = loadImages;
		this.selectedImg.onload = loadImages;
		this.startScreen.onload = loadImages;
		console.log('selectedPieces ' + this.selectedPieces);
		this.canvas.addEventListener('click', function(e) {
			console.log('gameState = ' + self.gameState);
			if(self.gameState == 'start' || self.gameState == 'end')
			{
				self.startGame();
				return;
			}
			if(self.currentTime <=0)
				return;
			var coords = self.getSelectedPiece(e);
			self.column = coords[0];
			self.row = coords[1];
			self.selectedIndex = coords[2];
			console.log('selectedPieces ' + self.selectedPieces);
			if(self.selectedPieces.length() >= 3)
			{
				self.selectedPieces.empty();
			}
			if(!self.selectedPieces.contains(self.selectedIndex))
			{
				self.selectedPieces.push(self.selectedIndex);
			}
			else{
				self.selectedPieces.remove(self.selectedIndex);
			}
			
			
			self.redrawSelected();
			
			if(self.selectedPieces.length() == 3)
			{
				
				var index1 = self.setGame.state[self.selectedPieces.val(0)];
				var index2 = self.setGame.state[self.selectedPieces.val(1)];
				var index3 = self.setGame.state[self.selectedPieces.val(2)];
				var piece1 = self.setGame.pieces[index1];
				var piece2 = self.setGame.pieces[index2];
				var piece3 = self.setGame.pieces[index3];
				
				var moveRes = self.setGame.move(index1,index2,index3);
				console.log('MatchScore = '+ moveRes);
				if(moveRes == true)
				{
					console.log('score = ' + self.score);
					self.score = parseInt(self.score)  + 1;
					console.log('score = ' + self.score);
					self.drawState = 1;
					
					/*
					setTimeout(function(){
						self.setGame.GetNewPieces(self.selectedPieces.val(0),self.selectedPieces.val(1),self.selectedPieces.val(2));	
						self.selectedPieces.empty();
						self.redrawSelected();
						}, 250);*/
				}
				else{
					self.drawState = 2;
					
					/*self.redrawWrong();
					setTimeout(function(){
						self.selectedPieces.empty();
						self.redrawSelected();
					},250);*/
					
				}
				
			}
		});
		
		
		
		
		
		
		//this.gameInterval = 0;
		
		//self.currentTime = 300;
		//gameInterval = setInterval(gameLoop, 100);
		
		
	};
	
	Game.prototype={
		startGame : function(){
			this.gameState = this.gameStates[1];
			/// update the tag with id "countdown" every 1 second
			this.currentTime = 300;
			console.log('calling setInterval!');
			var self = this;
			
			var gameInterval = setInterval(function(){
				
				self.addTime = self.addTime - 1;
				if(self.addTime < 20)
					self.addTime = 20;
					
				
			   	self.currentTime = parseInt(self.currentTime) - 1;
			   	console.log('addTime = ' + self.addTime);
			   	self.redrawSelected();

				if(self.drawState == 1)
				{
					self.currentTime += self.addTime;
					self.addTime = 80;
					//self.redrawCorrect();
					self.setGame.GetNewPieces(self.selectedPieces.val(0),self.selectedPieces.val(1),self.selectedPieces.val(2));
					self.selectedPieces.empty();	

				}
				else if(self.drawState == 2)
				{
					self.selectedPieces.empty();	
				}
				self.drawState = 0;
				if(self.currentTime <= 0)
				{
					self.gameState = 'end';
					clearInterval(gameInterval);
					self.drawFinished();
				}
				console.clear();
			}, 100);
			console.log('game interval = ' + this.gameInterval);
		},
	    gameLoop : function(){
			var self = this;
			
		},
		addListener: function(eventName, callback) {
		      var events = this._events,
		          callbacks = events[eventName] = events[eventName] || [];
		      callbacks.push(callback);
		  },
		raiseEvent: function(eventName, args) {
	      var callbacks = this._events[eventName];
	      for (var i = 0, l = callbacks.length; i < l; i++) {
	          callbacks[i].apply(null, args);
	      }
	  	},
		test : function() {
		    this.raiseEvent('ON_TEST', [1,2,3]); // whatever args to pass to listeners
		},
		
		drawOpeningScreen:function()
		{
			this.context.clearRect(0, 0, this.canvas.width, this.canvas.height);
			this.context.drawImage(this.startScreen,0,0);
		},
		
		draw:function()
		{
			this.redrawPieces();
			
		},
		drawFinished : function()
		{
			this.context.clearRect(0, 0, this.canvas.width, this.canvas.height);
			this.context.drawImage(this.background,0,0);
			this.drawScore();
			this.context.font="60px Georgia";
			this.context.fillStyle = 'yellow';
			this.context.fillText("THE END",100,200);
		},
		
		drawScore: function()
		{
			this.context.font="20px Georgia";
			this.context.fillStyle = 'yellow';
			this.context.fillText(this.score,400,30);
			var showMili = 0;
			if((this.currentTime / 10.0) < 10)
				showMili = 1;
			this.context.fillText((this.currentTime / 10.0).toFixed(showMili),430,30);
		},
		redrawPieces : function(){
			this.context.clearRect(0, 0, this.canvas.width, this.canvas.height);
			this.context.drawImage(this.background,0,0);
			var height = 0;
			for(var i=0;i<this.setGame.state.length;++i)
			{
				console.log(i+' '+this.setGame.state[i]);
				if(i>0 && (i)%this.columns == 0)
					height ++;
				this.context.drawImage(this.setGame.pieces[this.setGame.state[i]].image, this.pOffX + (i%this.columns)*105, this.pOffY + height*70);
				//context.drawImage(selectedImg, (i%width)*105,height*70);
			}
			this.drawScore();
			
		
		},
		
		redrawSelected : function()
		{
			
			this.redrawPieces();
			var height = 0;
			//for(var i=0;i<selectedIndices.length;++i)
			for(var i=0;i<this.selectedPieces.length();++i)
			{
				//var index= selectedIndices[i];
				var index = this.selectedPieces.val(i);
				console.log('index= ' + index+' '+this.setGame.state[index]);
				//if(index>0 && (index)%width == 0)
				//	height ++;
				height = parseInt(index / this.columns);
				//console.log('height = ' + height);	
				context.drawImage(this.setGame.pieces[this.setGame.state[index]].image, this.pOffX + (index%this.columns)*105,this.pOffY + height*70);
				context.drawImage(this.selectedImg, this.pOffX + (index%this.columns)*105,this.pOffY + height*70);
				console.log(this.setGame.pieces[this.setGame.state[index]].image.src);
			}
			if(this.drawState == 1)
			{
				this.redrawCorrect();
				//this.setGame.GetNewPieces(this.selectedPieces.val(0),this.selectedPieces.val(1),this.selectedPieces.val(2));
				//this.selectedPieces.empty();	
				
			}
			else if(this.drawState == 2)
			{
				this.redrawWrong();
				//this.selectedPieces.empty();	
			}
			//this.drawState = 0;
		},
		getSelectedPiece : function (e){
			var column,row,selectedIndex;
			//var pOffX = theGame.pOffX;
			//var pOffY = theGame.pOffY;
			//var width = theGame.width;
			//0-105,106-211,212-307,308-413
			if(e.offsetX < this.pOffX + 105)
			{
				column = 0;
			}
			else if(e.offsetX < this.pOffX + 211)
			{
				column = 1;
			}
			else if(e.offsetX < this.pOffX + 316)
			{
				column = 2;
			}
			else{
				column = 3;
			}
			if(e.offsetY < this.pOffY + 70)
			{
				row=  0;
			}
			else if(e.offsetY < this.pOffY + 140)
			{
				row = 1;
			}
			else 
			{
				row = 2;
			}
			selectedIndex =  (row * this.columns + column);
			return [column,row,selectedIndex];
		},
		
		redrawSelectedIndices: function(simg)
		{
				this.redrawPieces();
				var height = 0;
				//for(var i=0;i<selectedIndices.length;++i)
				for(var i=0;i<this.selectedPieces.length();++i)
				{
					//var index= selectedIndices[i];
					var index = this.selectedPieces.val(i);
					console.log('index= ' + index+' '+this.setGame.state[index]);
					//if(index>0 && (index)%width == 0)
					//	height ++;
					height = parseInt(index / this.columns);
					//console.log('height = ' + height);	
					context.drawImage(this.setGame.pieces[this.setGame.state[index]].image, this.pOffX + (index%this.columns)*105,this.pOffY + height*70);
					context.drawImage(simg, this.pOffX + (index%this.columns)*105,this.pOffY + height*70);
					console.log(this.setGame.pieces[this.setGame.state[index]].image.src);
				}
		},
		
		redrawWrong : function()
		{
			this.redrawSelectedIndices(this.wrongImg);
		
		},
		
		redrawCorrect : function()
		{
			this.redrawSelectedIndices(this.correctImg);
		}
		
		
		
	};

	

	
    return {
		MEDIA_ROOT : MEDIA_ROOT,
		BrainPiece : BrainPiece,
		BrainPieces : BrainPieces,
		Score : Score,
		SetPiece: SetPiece,
		SetLogic: SetLogic,
		SetGame : SetGame,
		Game : Game,
       
        drop_list_item_template : drop_list_item_template      
    };

})();



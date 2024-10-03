/* 
 * unions-and-tuples-oh-my.ts
 *     Created: 2024-10-05T17:19:16-04:00
 *    Modified: 2024-10-05T17:19:16-04:00
 *      Author: Justin Paul Chase <justin@justinwritescode.com>
 *   Copyright: © 2024 Justin Paul Chase, All Rights Reserved
 *     License: MIT (https://opensource.org/licenses/MIT)
 */

export type UnionToIntersection<U> =
    (U extends any ? (arg: U) => void : never) extends
    (arg: infer I) => void ? I : never;

export type LastOf<U> =
    UnionToIntersection<U extends any ? (x: U) => void : never> extends
    (x: infer L) => void ? L : never;

// Turns a union type into an intersection of functions
// Then extracts the last element of the union

export type Push<T extends any[], V> = [...T, V];

// Recursively constructs a tuple from the union
export type UnionToTuple<T, L = LastOf<T>, N = [T] extends [never] ? true : false> =
    true extends N ? [] : Push<UnionToTuple<Exclude<T, L>>, L>;

// // Usage Example
// type MyUnion = 'a' | 'b' | 'c';
// type MyTuple = UnionToTuple<MyUnion>; // Result: ['a', 'b', 'c']